class PricetagsController < ApplicationController
  def accept
    load_and_authorize_pricetag

    case pricetag.transaction_type
    when :direct_sale
      success = accept_direct_sale
    when :auction
      success = accept_auction
    when :group_offer
      success = accept_group_offer
    end

    cancel_remaining_offers if success

    respond_to do |format|
      if success
        format.html { redirect_to :back }
        format.js
      else
        format.html { redirect_to :back}
        format.js
      end
    end
  end

  def offer
    load_and_authorize_pricetag

    raise StandardError.new("You can't accept your own offers") if pricetag.user == current_user
    raise StandardError.new("Offer no longer accessible") unless pricetag.listed?
    raise StandardError.new("Counteroffers are not yet available") if Pricetag === pricetag.listing.class

    offer = Pricetag.new(pricetag_params)
    offer.price = pricetag.price if pricetag.direct_sale?
    offer.operation = pricetag.buy? ? :sell : :buy
    offer.listing = pricetag
    offer.user = current_user
    respond_to do |format|
      if offer.save
        format.html { redirect_to :back }
        format.js
      else
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def destroy
    load_and_authorize_pricetag

    pricetag.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  private

  attr_accessor :pricetag, :offer, :offers

  def accept_direct_sale
    offer = pricetag.offers.find(offer_params[:id])
    create_debt
  end

  def accept_auction
    if offer_params[:id]
      offer = pricetag.offers.find(offer_params[:id])
    else
      offers = pricetag.sell? ? pricetag.offers.order(:price, :desc) : pricetag.offers.order(:price, :asc)
      offer = offers.first
    end
    create_debt
  end

  def accept_group_offer
    offers = pricetag.offers
    amount = pricetag.price / offers.count
    ActiveRecord::Base.transaction do
      offers.each do |offer|
        create_debt(amount)
      end
    end
  end

  def create_debt(amount = offer.price)
    trade_params = pricetag.sell? ? { from: offer.user, to: pricetag.user, amount: amount } : { to: offer.user, from: pricetag.user, amount: amount }
    debt = Debt.new(trade_params)
    if debt.save
      pricetag.state = :completed
      pricetag.save
      offer.state = :completed
      offer.save
    end
  end

  def cancel_remaining_offers
    offers = pricetag.offers.except { |o| o.completed? }
    offers.update_all(status: :cancelled)
  end

  def load_and_authorize_pricetag
    @pricetag = Pricetag.find(params[:id])
    authorize @pricetag
  end

  def offer_params
    params.require(:offer).permit(:id)
  end

  def pricetag_params
    params.require(:pricetag).permit(:price)
  end
end
