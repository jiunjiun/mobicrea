class ServiceFurnituresController < ApplicationController
  expose :service
  expose :service_furniture
  expose :products, -> { service_furniture.products.paginate(page: params[:page]) }

  def show
  end
end
