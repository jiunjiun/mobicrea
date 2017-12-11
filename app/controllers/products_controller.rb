class ProductsController < ApplicationController
  expose :product

  before_action :update_meta

  def show
  end

  private
  def update_meta
    site = locale_field(product, :name)

    meta_tags_option = {
      site: site,
    }

    prepare_meta_tags meta_tags_option
  end
end
