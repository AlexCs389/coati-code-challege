class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :description
      t.float :price_per_piece

      t.timestamps
    end
  end
end
