class AdminController < ApplicationController
  before_action :authenticate_user!

  layout 'admin'

  before_action :set_locale, :update_meta, :setup_gon

  private
  def update_meta
    meta_tags_option = {
      site: I18n.t('backend'),
    }

    prepare_meta_tags meta_tags_option
  end

  def setup_gon
    gon.admin_summernote_upload = admin_summernote_upload_path
  end

  def set_locale
    I18n.locale = 'zh-TW'
  end
end
