class ServiceFurniture < Collection
  has_many :furniture_types, class_name: 'Collection', foreign_key: 'parent_id'

  has_many :photos,     class_name: 'ServiceFurniturePhoto'
  has_many :references, class_name: 'ServiceFurnitureReference'

  default_scope { where(type: Type::SERVICE_FURNITURE) }
end
