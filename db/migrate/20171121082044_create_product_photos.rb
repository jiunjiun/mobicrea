class CreateProductPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :product_photos do |t|
      t.references :product, foreign_key: true
      t.json        :image
      t.text        :url
      t.integer     :position
      t.boolean     :new_page

      t.timestamps
    end
  end
end
