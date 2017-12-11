module HelpersConcern
  extend ActiveSupport::Concern

  def is_locale_zh_tw?
    I18n.locale == :'zh-TW'
  end

  def locale_field resource, field
    if is_locale_zh_tw?
      resource.send("#{field}")
    else
      resource.send("#{field}_eng")
    end
  end
end

