class Product < ApplicationRecord
  has_many :summernote_uploads
  has_many :items, class_name: 'ProductItem'
  has_many :photos, class_name: 'ProductPhoto'
end
