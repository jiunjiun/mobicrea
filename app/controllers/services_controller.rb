class ServicesController < ApplicationController
  expose :service
  expose :success_case_products, -> { Product.where(collection_id: SuccessCase.all.pluck(:id)).order("RAND()").last(8) }

  before_action :update_meta

  def index
  end

  def show
  end

  private
  def update_meta
    case action_name
    when 'index'
      site = t('service')
    when 'show'
      site = locale_field(service, :name)
    end

    meta_tags_option = {
      site: site,
    }

    prepare_meta_tags meta_tags_option
  end
end
