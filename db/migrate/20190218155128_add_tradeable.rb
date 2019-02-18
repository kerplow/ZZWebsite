class AddTradeable < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :has_pricetag, :boolean, default: false
    add_column :options, :has_pricetag, :boolean, default: false
    add_column :notes, :has_pricetag, :boolean, default: false
    add_column :planner_events, :has_pricetag, :boolean, default: false
  end
end
