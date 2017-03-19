class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.references :expense_type, foreign_key: true
      t.references :price, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :pay_type, default: 0
      t.date :date_create
      t.time :hour_create

      t.timestamps
    end
  end
end
