class Brand < Collection
  default_scope { where(collection_type: CollectionType::BRAND) }

  mount_uploader :brand_logo, CollectionBrandLogoUploader

  before_create :setup

  private
  def setup
    self.collection_type = CollectionType::BRAND
  end
end

