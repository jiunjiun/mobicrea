class FurnitureType < Collection
  default_scope { where(type: Type::FURNITURE_TYPE) }
end
