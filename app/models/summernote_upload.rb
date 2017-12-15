class SummernoteUpload < ApplicationRecord
  belongs_to :product, optional: true

  mount_uploader :image, SummernoteImageUploader
end
