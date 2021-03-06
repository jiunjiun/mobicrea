class CreateServiceReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :service_references do |t|
      t.references  :service, references: :collections
      t.string      :title
      t.string      :subtitle
      t.json        :image
      t.text        :url
      t.integer     :position
      t.boolean     :new_page

      t.timestamps
    end
  end
end
