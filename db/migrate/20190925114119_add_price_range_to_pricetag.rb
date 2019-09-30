class AddPriceRangeToPricetag < ActiveRecord::Migration[5.0]
  def change
    add_column :pricetags, :start_price, :decimal, precision: 5, scale: 2
    add_column :pricetags, :buyout_price, :decimal, precision: 5, scale: 2
    change_column :pricetags, :price, :decimal, precision: 5, scale: 2
  end
end
