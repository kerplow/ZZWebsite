module Casheable
  include ActiveSupport::Concern

  included do
    raise "you require @from instance variable to make a model casheable" unless instance_variable_defined?(:@from)
    raise "you require @to instance variable to make a model casheable" unless instance_variable_defined?(@to)
    raise "you require @euro instance variable to make a model casheable" unless instance_variable_defined?(:@euro)
    raise "you require @collected? instance variable to make a model casheable" unless instance_variable_defined?(:@collected)

    def casheable?
      true
    end

    def collect

    end
  end
end
