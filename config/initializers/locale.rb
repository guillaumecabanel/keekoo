# Where the I18n library should search for translation files
I18n.load_path += Dir["#{Rails.root.to_s}/lib/locales/**/*.{rb,yml}"]

I18n.available_locales = [:en, :fr]
I18n.default_locale = :en
