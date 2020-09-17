class ConfirmationDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :confirmation, :string, default: "pending"
  end
end
