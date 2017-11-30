class Product < ApplicationRecord
  belongs_to :collection

  has_many :summernote_uploads
  has_many :items, class_name: 'ProductItem'
  has_many :photos, class_name: 'ProductPhoto'


  def prev
    Product.where("id < ?", self.id).last
  end

  def next
    Product.where("id > ?", self.id).first
  end
end
