class PageController < ApplicationController
  before_action :update_meta

  def about
  end

  def contact
  end

  private
  def update_meta
    case action_name
    when 'about'
      site = t('about')
    when 'contact'
      site = t('contact')
    end

    meta_tags_option = {
      site: site,
    }

    prepare_meta_tags meta_tags_option
  end
end
