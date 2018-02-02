class AddWeightToCollection < ActiveRecord::Migration[5.1]
  def change
    add_column :collections, :weight, :integer
  end
end
