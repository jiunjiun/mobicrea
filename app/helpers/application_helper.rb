module ApplicationHelper

  def current_locale
    locales = {
      'zh-TW': {
        class_name: 'tw',
        name: '繁體中文',
      },
      'en': {
        class_name: 'en',
        name: 'English',
      }
    }

    locales[I18n.locale.to_sym]
  end

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
