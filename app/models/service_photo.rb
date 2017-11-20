class ServicePhoto < ApplicationRecord
  belongs_to :service, class_name: 'Collection', optional: true, foreign_key: 'parent_id'

  mount_uploader :image, ServicePhotoImageUploader

  before_create :update_position

  def as_json opts={}
    super.merge({
      size: self.image.size,
      url: self.image.try(:url),
      name: self.image.try(:file).try(:filename)
    })
  end

  private
  def update_position
    self.position = Slider.count + 1
  end
end
