class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.boolean :confirmation
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
