class LostItem < ApplicationRecord
  # zie database voor de andere velden
  belongs_to :found_by
  belongs_to :lost_by
end
