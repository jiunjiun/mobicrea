class CreateProductRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :product_relations do |t|
      t.references :product, foreign_key: true
      t.references :relation, references: :product

      t.timestamps
    end
  end
end
