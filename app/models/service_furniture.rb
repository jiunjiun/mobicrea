class ServiceFurniture < Collection
  has_many :furniture_types, class_name: 'Collection', foreign_key: 'parent_id'

  default_scope { where(collection_type: CollectionType::SERVICE_FURNITURE) }

  before_create :setup

  private
  def setup
    self.collection_type = CollectionType::SERVICE_FURNITURE
  end
end
