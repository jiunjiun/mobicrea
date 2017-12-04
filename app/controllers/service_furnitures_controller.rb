class ServiceFurnituresController < ApplicationController
  expose :service
  expose :service_furniture
  expose :products, -> { service_furniture.products.paginate(page: params[:page]) }

  before_action :update_meta

  def show
  end

  private
  def update_meta
    site = service_furniture.name

    meta_tags_option = {
      site: site,
    }

    prepare_meta_tags meta_tags_option
  end
end
