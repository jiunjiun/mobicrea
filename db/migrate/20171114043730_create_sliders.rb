class CreateSliders < ActiveRecord::Migration[5.1]
  def change
    create_table :sliders do |t|
      t.json    :image
      t.text    :url
      t.integer :position
      t.boolean :new_page

      t.timestamps
    end
  end
end
