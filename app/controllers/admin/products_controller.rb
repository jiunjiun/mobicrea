class Admin::ProductsController < AdminController
  expose :service
  expose :service_furniture
  expose :products, -> { service_furniture.products.paginate(page: params[:page]) }
  expose :product, build: ->(product_params, scope){ products.build(product_params) }

  before_action :setup, only: [ :new, :edit ]
  before_action :setup_show, only: [ :show ]

  def index
  end

  def show
  end

  def new
  end

  def create
    if product.save
      redirect_to admin_service_service_furniture_product_path(service, service_furniture, product), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if product.update product_params
      redirect_to admin_service_service_furniture_product_path(service, service_furniture, product), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    product.destroy
    redirect_to admin_service_service_furniture_path(service, service_furniture), notice: t('helpers.successfully_destroy')
  end

  private
  def product_params
    params.require(:product).permit(:uid, :name, :name_eng, :hash_tag, :description, :design_story)
  end

  def setup
    gon.product_id = product.id
  end

  def setup_show
    gon.admin_service_service_furniture_product_photos_path = admin_service_service_furniture_product_photos_path(service, service_furniture, product)
    gon.update_position_admin_service_service_furniture_product_photos_path = update_position_admin_service_service_furniture_product_photos_path(service, service_furniture, product)
  end
end
