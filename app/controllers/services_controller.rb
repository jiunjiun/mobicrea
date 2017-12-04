class ServicesController < ApplicationController
  expose :service

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
      site = service.name
    end

    meta_tags_option = {
      site: site,
    }

    prepare_meta_tags meta_tags_option
  end
end
