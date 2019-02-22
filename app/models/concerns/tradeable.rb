module Tradeable
  extend ActiveSupport::Concern

  included do
    has_one :pricetag, as: :listing
    accepts_nested_attributes_for :pricetag
    validates_associated :pricetag

    def tradeable?
      true
    end


  end
end
