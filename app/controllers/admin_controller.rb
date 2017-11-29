class AdminController < ApplicationController
  before_action :authenticate_user!

  layout 'admin'

  before_action :update_meta
  before_action :setup_gon

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
end
