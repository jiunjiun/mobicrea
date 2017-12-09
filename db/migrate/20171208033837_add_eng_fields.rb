class AddEngFields < ActiveRecord::Migration[5.1]
  def change
    # collection
    add_column :collections, :name_eng, :string
    add_column :collections, :prompt_text_eng, :string
    add_column :collections, :description_eng, :text

    # product_items
    add_column :product_items, :key_eng, :string
    add_column :product_items, :value_eng, :string

    # products
    add_column :products, :hash_tag_eng, :string
    add_column :products, :description_eng, :text
    add_column :products, :design_story_eng, :text

    # service_photos
    add_column :service_photos, :title_eng, :string
    add_column :service_photos, :subtitle_eng, :string

    # service_references
    add_column :service_references, :title_eng, :string
    add_column :service_references, :subtitle_eng, :string
  end
end
