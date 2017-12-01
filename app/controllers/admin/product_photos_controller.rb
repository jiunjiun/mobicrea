class Admin::ProductPhotosController < AdminController
  expose :service
  expose :service_furniture
  expose :product
  expose :product_photos, -> { product.photos.order(:position) }
  expose :product_photo, build: ->(product_photo_params, scope){ product_photos.build(product_photo_params) }

  def index
    respond_to do |format|
      format.json
    end
  end

  def create
    if product_photo.save
      result = { status: :success, product_photo: {id: product_photo.id} }
    else
      result = { status: :fail }
    end

    render json: result
  end

  def update_position
    photo_params = params[:product_photo]
    if product_photos.update photo_params.keys, photo_params.values
      result = { status: :success }
    else
      result = { status: :fail }
    end

    render json: result
  end

  private
  def product_photo_params
    params.require(:product_photo).permit(:title, :subtitle, :image, :url, :position, :new_page)
  end
end
