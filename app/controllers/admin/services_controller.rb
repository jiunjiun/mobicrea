class Admin::ServicesController < AdminController
  expose :services, -> { Service.paginate(page: params[:page]) }
  expose :service

  def index
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
    redirect_to admin_users_path, notice: t('helpers.successfully_destroy')
  end

  private
  def service_params
    params.require(:service).permit(:name)
  end
end
