class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string     :name
      t.string     :collection_type
      t.references :parent, references: :collections
      t.string     :prompt_text
      t.text       :description


      t.timestamps
    end
  end
end
