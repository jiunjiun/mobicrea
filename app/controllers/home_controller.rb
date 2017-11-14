class HomeController < ApplicationController
  expose :sliders, -> { Slider.order(:position) }
  before_action :update_meta

  def index
  end

  private
  def update_meta
    meta_tags_option = {}
    prepare_meta_tags meta_tags_option
  end
end
