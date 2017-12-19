class Collection < ApplicationRecord
  belongs_to :parent, class_name: 'Collection', optional: true, foreign_key: 'parent_id'
  has_many   :childs, class_name: 'Collection', foreign_key: 'parent_id'

  has_many :products, dependent: :destroy
  has_many :product_photos, dependent: :destroy

  module CollectionType
    SERVICE           = 'service'
    SERVICE_FURNITURE = 'service_furniture'
    SUCCESS_CASE      = 'success_case'
    BRAND             = 'brand'
  end
end
