class AddInfoToCollection < ActiveRecord::Migration[5.1]
  def change
    add_column :collections, :link, :text
    add_column :collections, :file_link, :text
  end
end
