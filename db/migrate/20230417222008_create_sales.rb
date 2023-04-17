class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :amount_of_pieces
      t.references :client, foreign_key: true
      t.references :product, foreign_key: true
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
