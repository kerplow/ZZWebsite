class ChangePricetagStateToTransactionState < ActiveRecord::Migration[5.0]
  def change
    rename_column :pricetags, :state, :transaction_state
  end
end
