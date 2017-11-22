class CreateSummernoteUploads < ActiveRecord::Migration[5.1]
  def change
    create_table :summernote_uploads do |t|
      t.references :product, foreign_key: true
      t.json        :image

      t.timestamps
    end
  end
end
