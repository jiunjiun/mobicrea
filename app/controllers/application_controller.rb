class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include HelpersConcern

  expose :services, -> { Service.all }
  expose :success_cases, -> { SuccessCase.order(weight: :desc).all }
  expose :brands, -> { Brand.all }

  before_action :set_locale

  private
  def prepare_meta_tags opts = {}
    title       = opts[:title] || I18n.t('title')
    site        = opts[:site] || ''
    description = opts[:description] || I18n.t('meta.desc')
    keywords    = opts[:keywords] || I18n.t('meta.keywords')

    defaults = {
      # common
      title: title,
      site: site,
      description: description,
      keywords: keywords,

      # facebook
      og: {
        title: site.present? ? "#{site} | #{title}" : title,
        description: description,
        url: request.original_url,
        site_name: title,
        type: opts[:type] || 'website',
        image: opts[:image]
      },

      # 'apple-mobile-web-app-capable': 'yes',
      # 'apple-touch-fullscreen': 'yes',

      # twitter: {
      #   card: 'summary',
      #   title: site.present? ? "#{site} | #{title}" : title,
      #   description: description,
      #   url: request.original_url,
      #   image: opts[:image]
      # }
    }

    set_meta_tags defaults
  end

  def set_locale
    session[:lang] = params[:lang] if params[:lang]
    session[:lang] ||= extract_locale_from_accept_language_header

    session[:lang] = 'zh-TW' unless session[:lang] == 'zh-TW' or session[:lang] == 'en'

    I18n.locale = session[:lang]
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first if request.env['HTTP_ACCEPT_LANGUAGE']
  end
end
