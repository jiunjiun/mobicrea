class Collection < ApplicationRecord
  belongs_to :parent, class_name: 'Collection', optional: true, foreign_key: 'parent_id'
  has_many   :childs, class_name: 'Collection', foreign_key: 'parent_id'

  module Type
    SERVICE           = 'service'
    SERVICE_FURNITURE = 'service_furniture'
    FURNITURE_TYPE    = 'furniture_type'
  end
end
