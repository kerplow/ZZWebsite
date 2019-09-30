module Services
  class Trader
    def initialize(context)
      @context = context
    end

    def execute
      case @context.class_name.underscore
      when 'direct_trade'
        direct_trade
      when 'bid_auction'
        bid_auction
      when 'close_auction'
        close_auction
      end
    end

    private

    def direct_trade
      context.item.transaction_state = :completed
      context.item.save
      context.transaction_record.create_transaction
      context.transaction_record.set_buyer context.buyer.credentials
      context.transaction_record.set_seller context.seller.credentials
      context.transaction_record.set_item context.item
      context.transaction_record.save
    end

    def bid
      context.item.price
    end

    def close_auction
      if context.item.min_price <= context.transaction_record.current_offer

        context.item.transaction_state = :completed

    end
  end
end
