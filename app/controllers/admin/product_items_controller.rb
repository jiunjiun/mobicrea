class Admin::ProductItemsController < AdminController
  expose :service
  expose :service_furniture
  expose :product
  expose :product_items, -> { product.items }
  expose :product_item, build: ->(product_item_params, scope){ product_items.build(product_item_params) }

  def new
  end

  def create
    if product_item.save
      redirect_to admin_service_service_furniture_product_path(service, service_furniture, product), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if product_item.update(product_item_params)
      redirect_to admin_service_service_furniture_product_path(service, service_furniture, product), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    product_item.destroy
    redirect_to admin_service_service_furniture_product_path(service, service_furniture, product), notice: t('helpers.successfully_destroy')
  end

  private
  def product_item_params
    params.require(:product_item).permit(:key, :value)
  end
end
