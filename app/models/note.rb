class Note < ApplicationRecord
  belongs_to :parent, class_name: "Note", foreign_key: "parent_id", optional: true
  has_many :comments, class_name: "Note", foreign_key: 'parent_id'
  belongs_to :user, optional: true

  include Tradeable
end
