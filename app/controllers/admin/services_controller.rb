class Admin::ServicesController < AdminController
  expose :services, -> { Service.paginate(page: params[:page]) }
  expose :service
  expose :service_furnitures, -> { service.service_furnitures.paginate(page: params[:page]) }

  before_action :setup, only: [:show]

  def index
  end

  def show
  end

  def new
  end

  def create
    if service.save
      redirect_to admin_services_path, notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if service.update service_params
      redirect_to admin_services_path, notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    service.destroy
    redirect_to admin_services_path, notice: t('helpers.successfully_destroy')
  end

  private
  def service_params
    params.require(:service).permit(:name, :description, :prompt_text, :name_eng, :description_eng, :prompt_text_eng)
  end

  def setup
    gon.admin_service_photos_path = admin_service_photos_path(service)
    gon.update_position_admin_service_photos_path = update_position_admin_service_photos_path(service)

    gon.admin_service_references_path = admin_service_references_path(service)
    gon.update_position_admin_service_references_path = update_position_admin_service_references_path(service)
  end
end
