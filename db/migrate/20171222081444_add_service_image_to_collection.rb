class AddServiceImageToCollection < ActiveRecord::Migration[5.1]
  def change
    add_column :collections, :service_image, :json
  end
end
