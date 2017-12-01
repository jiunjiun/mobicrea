class Admin::ProductsController < AdminController
  expose :service, id: ->{ params[:service_id] }
  expose :service_furniture, id: ->{ params[:service_furniture_id] }
  expose :success_case, id: ->{ params[:success_case_id] }
  expose :brand, id: ->{ params[:brand_id] }
  expose :products, -> { expose_products }
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
      if !service.new_record? and !service_furniture.new_record?
        redirect_to admin_service_service_furniture_product_path(service, service_furniture, product), notice: t('helpers.successfully_created')
      elsif !success_case.new_record?
        redirect_to admin_success_case_product_path(success_case, product), notice: t('helpers.successfully_created')
      elsif !brand.new_record?
        redirect_to admin_brand_product_path(brand, product), notice: t('helpers.successfully_created')
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if product.update product_params
      if !service.new_record? and !service_furniture.new_record?
        redirect_to admin_service_service_furniture_product_path(service, service_furniture, product), notice: t('helpers.successfully_updated')
      elsif !success_case.new_record?
        redirect_to admin_success_case_product_path(success_case, product), notice: t('helpers.successfully_updated')
      elsif !brand.new_record?
        redirect_to admin_brand_product_path(brand, product), notice: t('helpers.successfully_updated')
      end

    else
      render :edit
    end
  end

  def destroy
    product.destroy
    if !service.new_record? and !service_furniture.new_record?
      redirect_to admin_service_service_furniture_path(service, service_furniture), notice: t('helpers.successfully_destroy')
    elsif !success_case.new_record?
      redirect_to admin_success_case_path(success_case), notice: t('helpers.successfully_destroy')
    elsif !brand.new_record?
      redirect_to admin_brand_path(brand), notice: t('helpers.successfully_destroy')
    end
  end

  private
  def product_params
    params.require(:product).permit(:uid, :name, :name_eng, :hash_tag, :description, :design_story)
  end

  def expose_products
    if !service.new_record? and !service_furniture.new_record?
      service_furniture.products.paginate(page: params[:page])
    elsif !success_case.new_record?
      success_case.products.paginate(page: params[:page])
    elsif !brand.new_record?
      brand.products.paginate(page: params[:page])
    end
  end

  def setup
    gon.product_id = product.id
  end

  def setup_show
    if !service.new_record? and !service_furniture.new_record?
      gon.admin_product_photos_path = admin_service_service_furniture_product_photos_path(service, service_furniture, product)
      gon.update_position_admin_product_photos_path = update_position_admin_service_service_furniture_product_photos_path(service, service_furniture, product)
    elsif !success_case.new_record?
      gon.admin_product_photos_path = admin_success_case_product_photos_path(success_case, product)
      gon.update_position_admin_product_photos_path = update_position_admin_success_case_product_photos_path(success_case, product)
    elsif !brand.new_record?
      gon.admin_product_photos_path = admin_brand_product_photos_path(brand, product)
      gon.update_position_admin_product_photos_path = update_position_admin_brand_product_photos_path(brand, product)
    end
  end
end
