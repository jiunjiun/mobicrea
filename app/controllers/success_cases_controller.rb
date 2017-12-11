class SuccessCasesController < ApplicationController
  expose :success_case
  expose :products, -> { success_case.products.paginate(page: params[:page]) }

  before_action :update_meta

  def index
  end

  def show
  end

  private
  def update_meta
    case action_name
    when 'index'
      site = t('success_case')
    when 'show'
      site = locale_field(success_case, :name)
    end

    meta_tags_option = {
      site: site,
    }

    prepare_meta_tags meta_tags_option
  end
end
