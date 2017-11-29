class Admin::ServiceReferencesController < AdminController
  expose :service
  expose :service_references, -> { service.references.order(:position) }
  expose :service_reference, build: ->(service_reference_params, scope){ service_references.build(service_reference_params) }

  def index
    respond_to do |format|
      format.json
    end
  end

  def create
    if service_reference.save
      result = { status: :success, service_reference: {id: service_reference.id} }
    else
      result = { status: :fail }
    end

    render json: result
  end

  def edit
  end

  def update
    if service_reference.update service_reference_params
      redirect_to edit_admin_service_reference_path(service, service_reference), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    if service_reference.destroy
      result = { status: :success }
    else
      result = { status: :fail }
    end

    render json: result
  end

  def update_position
    photo_params = params[:service_reference]
    if service_references.update photo_params.keys, photo_params.values
      result = { status: :success }
    else
      result = { status: :fail }
    end

    render json: result
  end

  private
  def service_reference_params
    params.require(:service_reference).permit(:title, :subtitle, :image, :url, :position, :new_page)
  end
end
