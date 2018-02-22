class Admin::SuccessCasesController < AdminController
  expose :success_cases, -> { SuccessCase.order(weight: :desc).paginate(page: params[:page]) }
  expose :success_case
  expose :products, -> { success_case.products.order(weight: :desc) }


  def index
  end

  def show
  end

  def new
  end

  def create
    if success_case.save
      redirect_to admin_success_case_path(success_case), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if success_case.update success_case_params
      redirect_to admin_success_case_path(success_case), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    success_case.destroy
    redirect_to admin_success_cases_path, notice: t('helpers.successfully_destroy')
  end

  private
  def success_case_params
    params.require(:success_case).permit(:name, :name_eng, :weight)
  end
end
