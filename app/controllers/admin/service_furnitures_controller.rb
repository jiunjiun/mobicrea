class Admin::ServiceFurnituresController < AdminController
  expose :service
  expose :service_furnitures, -> { service.service_furnitures.paginate(page: params[:page]) }
  expose :service_furniture, build: ->(service_furniture_params, scope){ service_furnitures.build(service_furniture_params) }
  expose :products, -> { service_furniture.products }

  def index
  end

  def new
  end

  def create
    if service_furniture.save
      redirect_to admin_service_service_furniture_path(service, service_furniture), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if service_furniture.update service_furniture_params
      redirect_to admin_service_service_furniture_path(service, service_furniture), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    service_furniture.destroy
    redirect_to admin_service_path(service), notice: t('helpers.successfully_destroy')
  end

  private
  def service_furniture_params
    params.require(:service_furniture).permit(:name, :name_eng, :weight)
  end
end
