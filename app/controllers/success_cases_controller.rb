class SuccessCasesController < ApplicationController
  expose :success_case
  expose :products, -> { success_case.products.paginate(page: params[:page]) }

  def index
  end

  def show
  end
end
