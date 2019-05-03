class AddPolleableToOptions < ActiveRecord::Migration[5.0]
  def change
    add_reference :options, :polleable, polymorphic: true, index: true
  end
end
