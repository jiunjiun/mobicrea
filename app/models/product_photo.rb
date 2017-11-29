class ProductPhoto < ApplicationRecord
  belongs_to :product, optional: true

  mount_uploader :image, ProductPhotoImageUploader

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
