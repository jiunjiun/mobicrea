class ProductRelation < ApplicationRecord
  belongs_to :product
  belongs_to :relation, class_name: 'Product', foreign_key: 'relation_id'
end
