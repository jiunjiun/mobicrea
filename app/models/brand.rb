class Brand < Collection
  default_scope { where(collection_type: CollectionType::BRAND) }

  before_create :setup

  private
  def setup
    self.collection_type = CollectionType::BRAND
  end
end

