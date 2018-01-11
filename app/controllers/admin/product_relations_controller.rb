class Admin::ProductRelationsController < AdminController
  expose :success_case, id: -> { params[:success_case_id] }
  expose :product, id: -> { params[:product_id] }
  expose :product_relations, -> { product.product_relations }
  expose :product_relation, build: ->(product_relation_params, scope){ product_relations.build(product_relation_params) }

  before_action :check_success_case

  def new
  end

  def create
    if product_relation.save
      redirect_to admin_success_case_product_path(success_case, product), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if product_relation.update(product_relation_params)
      redirect_to admin_success_case_product_path(success_case, product), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    product_relation.destroy
    redirect_to admin_success_case_product_path(success_case, product), notice: t('helpers.successfully_destroy')
  end

  private
  def product_relation_params
    params.require(:product_relation).permit(:relation_id)
  end

  def check_success_case
    if success_case.new_record?
      redirect_to session.delete(:return_to) and return
    end
  end
end
