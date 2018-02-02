class AddWeightToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :weight, :integer
  end
end
