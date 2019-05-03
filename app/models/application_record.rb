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
end
