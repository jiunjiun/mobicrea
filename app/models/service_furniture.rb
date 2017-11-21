class ServiceFurniture < Collection
  default_scope { where(collection_type: CollectionType::SERVICE_FURNITURE) }

  before_create :setup

  private
  def setup
    self.collection_type = CollectionType::SERVICE_FURNITURE
  end
end
