class ConfirmationToString < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :confirmation, :string
  end
end
