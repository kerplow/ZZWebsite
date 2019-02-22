class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def tradeable?
    false
  end

  after_initialize do
    if self.attributes.include?('has_pricetag') and self.has_pricetag?
      self.extend Tradeable
    end
    self
  end

  def self.with_pricetag(args = {})
    if self.column_names.include? 'has_pricetag'
      pricetag = Pricetag.new(args.delete(:pricetag) || args.delete(:pricetag_attributes))
      record = self.new(args.merge({ has_pricetag: true }))
      record.pricetag = pricetag
      record
    else
      raise StandardError.new('this model is not tradeable')
    end
  end
end
