class CreateProductItems < ActiveRecord::Migration[5.1]
  def change
    create_table :product_items do |t|
      t.references :product, foreign_key: true
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
