class Service < Collection
  has_many :service_furnitures, foreign_key: 'parent_id'

  has_many :photos,     class_name: 'ServicePhoto'
  has_many :references, class_name: 'ServiceReference'

  mount_uploader :service_image, CollectionServiceImageUploader

  default_scope { where(collection_type: CollectionType::SERVICE) }

  before_create :setup

  private
  def setup
    self.collection_type = CollectionType::SERVICE
  end
end
