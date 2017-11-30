class Admin::ProductItemsController < AdminController
  expose :service, id: ->{ params[:service_id] }
  expose :service_furniture, id: ->{ params[:service_furniture_id] }
  expose :success_case, id: ->{ params[:success_case_id] }
  expose :product, id: ->{ params[:product_id] }
  expose :product_items, -> { product.items }
  expose :product_item, build: ->(product_item_params, scope){ product_items.build(product_item_params) }

  def new
  end

  def create
    if product_item.save
      if !service.new_record? and !service_furniture.new_record?
        redirect_to admin_service_service_furniture_product_path(service, service_furniture, product), notice: t('helpers.successfully_created')
      elsif !success_case.new_record?
        redirect_to admin_success_case_product_path(success_case, product), notice: t('helpers.successfully_created')
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if product_item.update(product_item_params)
      if !service.new_record? and !service_furniture.new_record?
        redirect_to admin_service_service_furniture_product_path(service, service_furniture, product), notice: t('helpers.successfully_updated')
      elsif !success_case.new_record?
        redirect_to admin_success_case_product_path(success_case, product), notice: t('helpers.successfully_updated')
      end
    else
      render :edit
    end
  end

  def destroy
    product_item.destroy
    if !service.new_record? and !service_furniture.new_record?
      redirect_to admin_service_service_furniture_product_path(service, service_furniture, product), notice: t('helpers.successfully_destroy')
    elsif !success_case.new_record?
      redirect_to admin_success_case_product_path(success_case, product), notice: t('helpers.successfully_destroy')
    end
  end

  private
  def product_item_params
    params.require(:product_item).permit(:key, :value)
  end
end
