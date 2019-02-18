class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def tradeable?
    false
  end

  # after_initialize do
  #   if self&.tradeable?
  #     self.extend Tradeable
  #   end
  # end

  # def self.tradeable(args)
  #   byebug
  #   if self.column_names.include? 'has_pricetag'
  #     pricetag = Pricetag.new(args[:pricetag])
  #     self.send('include', Tradeable).new(args.merge({pricetag: pricetag}))
  #   else
  #     raise StandardError.new('this model is not tradeable')
  #   end
  # end
end
