module Services
  module Tradeable
    module Contexts
      class DirectSale
        attr_reader :item, :buyer, :seller, :transaction_record, :debt

        ITEM_REQUIREMENTS = %W(price user state)
        TRADER_REQUIREMENTS = %w(verified)

        # container class to hold roles and assign them to the object participation in the interaction
        def initialize(item, interested_party)
          # check if roles are applicable and assing objects to roles
          @item = item if self.class.tradeable? item
          @transaction_record = TransactionRecord.new
          @debt = Debt.new
          case @item.operation
          when :buy
            @buyer = item.user
            @seller = interested_party
          when :sell
            @seller = item.user
            @buyer = interested_party
          end
        end

        def self.tradeable?(item)
          # check if item is tradeable
          return false unless item.accessible_attributes.to_set.superset?(ITEM_REQUIREMENTS.to_set)
        end

        def self.trader?(user)
          # check if user is verified
          return false unless user.accessible_attributes.to_set.superset?(TRADER_REQUIREMENTS.to_set)
        end
      end
    end
  end
end
