class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references  :collection, foreign_key: true
      t.string      :uid
      t.string      :name
      t.string      :name_eng
      t.string      :hash_tag
      t.text        :description
      t.text        :design_story
      t.json        :image

      t.timestamps
    end
  end
end
