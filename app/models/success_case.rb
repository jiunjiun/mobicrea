class SuccessCase < Collection
  default_scope { where(collection_type: CollectionType::SUCCESS_CASE) }

  before_create :setup

  private
  def setup
    self.collection_type = CollectionType::SUCCESS_CASE
  end
end

