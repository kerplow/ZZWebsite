class Tradeable < Module
  def initialize
    byebug
    base.class.has_one :pricetag, as: :listing, inverse_of: 'listing'
    base.class.accepts_nested_attributes_for :pricetag
    base.class.validates_presence_of :pricetag
  end

    def tradeable?
      true
    end

end
