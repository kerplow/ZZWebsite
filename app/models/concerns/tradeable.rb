module Tradeable
  extend ActiveSupport::Concern

  included do
    base_class.class_eval do
      attr_accessor :has_pricetag

      has_one :pricetag, dependent: :destroy
      has_many :offers, through: :pricetag, class_name: 'Pricetag'

      def self.with_pricetag(args = {})
        if self.column_names.include? 'has_pricetag'
          pricetag = Pricetag.new(args.delete(:pricetag))
          pricetag.user ||= current_user
          record = self.new(args)
          record.pricetag = pricetag
          record
        else
          raise StandardError.new('this model is not tradeable')
        end
      end
    end

    def tradeable?
      true
    end
  end
end
