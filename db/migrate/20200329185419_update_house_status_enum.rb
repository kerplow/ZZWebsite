class UpdateHouseStatusEnum < ActiveRecord::Migration[5.0]
  def change
    create_enum :house_statuses, [:housemate, :subrenter, :old_housemate, :house_pet]
    remove_column :users, :house_status, :integer
    add_column :users, :house_status, :house_statuses, default: :house_pet, index: true
  end
end
