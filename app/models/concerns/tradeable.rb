module Tradeable
  extend ActiveSupport::Concern

  included do
    base_class.class_eval do
      has_one :pricetag, dependent: :destroy
      has_many :offers, through: :pricetag, class_name: 'Pricetag'
    end

    def tradeable?
      true
    end
  end
end
