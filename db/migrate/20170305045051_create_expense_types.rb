class CreateExpenseTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :expense_types do |t|
      t.string :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
