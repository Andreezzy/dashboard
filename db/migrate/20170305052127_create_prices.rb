class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.integer :money, default: 0
      t.integer :total, default: 0
      t.integer :dolar_price, default: 10000
      #t.references :expense, foreign_key: true

      t.timestamps
    end
  end
end
