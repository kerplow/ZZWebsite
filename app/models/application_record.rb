class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def tradeable?
    false
  end

  after_initialize do |record|
    if record.attributes.include?('has_pricetag') and record.has_pricetag?
      record.extend Tradeable
    end
    record
  end

  def self.with_pricetag(args = {})
    if self.column_names.include? 'has_pricetag'
      pricetag = Pricetag.new(args.delete(:pricetag) || args.delete(:pricetag_attributes))
      pricetag.user = args[:user]
      record = self.new(args.merge({ has_pricetag: true }))
      record.pricetag = pricetag
      record
    else
      raise StandardError.new('this model is not tradeable')
    end
  end
end
