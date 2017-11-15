class Service < Collection
  has_many :service_furnitures, class_name: 'Collection', foreign_key: 'parent_id'

  default_scope { where(type: Type::SERVICE) }
end
