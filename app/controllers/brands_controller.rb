class BrandsController < ApplicationController
  expose :brand

  before_action :update_meta

  def index
  end

  def show
  end

  private
  def update_meta
    case action_name
    when 'index'
      site = t('brand')
    when 'show'
      site = locale_field(brand, :name)
    end

    meta_tags_option = {
      site: site,
    }

    prepare_meta_tags meta_tags_option
  end
end
