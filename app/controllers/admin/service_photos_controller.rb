class Admin::ServicePhotosController < AdminController
  expose :service
  expose :service_photos, -> { service.photos.order(:position) }
  expose :service_photo, build: ->(service_photo_params, scope){ service_photos.build(service_photo_params) }

  def index
    respond_to do |format|
      format.json
    end
  end

  def create
    if service_photo.save
      result = { status: :success, service_photo: {id: service_photo.id} }
    else
      result = { status: :fail }
    end

    render json: result
  end

  def edit
  end

  def update
    if service_photo.update service_photo_params
      redirect_to edit_admin_service_service_photo_path(service, service_photo), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    if service_photo.destroy
      result = { status: :success }
    else
      result = { status: :fail }
    end

    render json: result
  end

  def update_position
    photo_params = params[:service_photo]
    if service_photos.update photo_params.keys, photo_params.values
      result = { status: :success }
    else
      result = { status: :fail }
    end

    render json: result
  end

  private
  def service_photo_params
    params.require(:service_photo).permit(:title, :subtitle, :image, :url, :position, :new_page)
  end
end
