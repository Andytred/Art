class AddForeignKeysToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :user
    add_reference :transactions, :artwork
  end
end
