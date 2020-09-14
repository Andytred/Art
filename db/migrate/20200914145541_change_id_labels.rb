class ChangeIdLabels < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :user_id, :buyer_id
  end
end
