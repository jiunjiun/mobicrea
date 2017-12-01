class Admin::BrandsController < AdminController
  expose :brands, -> { Brand.paginate(page: params[:page]) }
  expose :brand
  expose :products, -> { brand.products }


  def index
  end

  def show
  end

  def new
  end

  def create
    if brand.save
      redirect_to admin_brand_path(brand), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if brand.update brand_params
      redirect_to admin_brand_path(brand), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    brand.destroy
    redirect_to admin_brands_path, notice: t('helpers.successfully_destroy')
  end

  private
  def brand_params
    params.require(:brand).permit(:name, :description, :link, :file_link, :brand_logo)
  end
end
