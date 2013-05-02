# encoding: utf-8
# RailsAdmin config file. Generated on September 25, 2012 21:29
# See github.com/sferik/rails_admin for more informations
require Rails.root.join('lib', 'copyres.rb')
RailsAdmin.config do |config|

  module RailsAdmin
    module Config
      module Actions
        class CopyResource < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
        end
      end
    end
  end


  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    copy_resource
	
    # member actions
    show
    edit
    delete
    history_show
    show_in_app
  end
  #конфигурирование моделей админки
  config.model Page do
  
#    navigation_label 'Страницы'
    configure :top_menu do
      label "Отображать в верхнем меню"
    end
    configure :main_menu do
      label "Отображать в главном меню"
    end
    configure :name do
      label "Название"
    end
    configure :content do
      label "Содержимое"
    end
    configure :sidebar do
      label "Отображать в сайдбаре"
    end
    list do
      field :name do
        label "Название"
      end
      field :city do
        label "Город"
      end
      field :created_at do
        label "Добавлена"
      end
    end

    edit do
      field :top_menu
      field :main_menu
      field :sidebar
      field :name
      field :city
      field :content, :text do
        ckeditor true
      end
      field :permalink
      field :position
      field :title
      field :meta_description
      field :meta_keywords
    end
  end

  config.model Gallery do
    configure :title do
      label "Заголовок"
    end
    configure :name do
      label "Название"
    end
    configure :img do
      label "Изображение"
    end

    edit do
      field :title
      field :name
      field :imgs
      #field :title
    end
  end

  config.model Article do
#    navigation_label 'Страницы'
    configure :title do
      label "Заголовок"
    end
    configure :name do
      label "Название"
    end
    configure :content do
      label "Содержимое"
    end
    configure :city do
      label "Город"
    end

    list do
      field :id
      field :name
      field :preview_text
      field :city
      field :created_at do
        label "Создана"
      end
      field :updated_at do
        label "Изменена"
      end
    end

    edit do
      field :title
      field :name
      field :city
      field :preview_text
      field :content, :text do
        ckeditor true
      end

      field :meta_description
      field :meta_keywords

      field :permalink
      field :position
      field :image
      field :red_class do
        label "Отметить красным"
      end
    end
  end


  config.model City do
#    navigation_label 'Страницы'
    configure :title do
      label "Заголовок"
    end
    configure :name do
      label "Название"
    end
    configure :subdomain do
      label "Субдомен"
    end
    configure :email do
      label "Электронный адрес"
    end
    configure :phones do
      label "Телефоны"
    end
    list do
      #field :id
      field :name
      field :subdomain do
        label "Субдомен"
      end
      field :email
      field :updated_at do
        label "Последнее изменение"
      end
    end

    edit do
      #field :title
      field :name
      field :subdomain
      field :email
      field :phones
      field :meta_description
      field :meta_keywords
    end
  end

  # модель новостей. newse потому что rails_admin негативно
  # относится к имени news и new ))
  config.model Newse do

    configure :title do
      label "Заголовок"
    end
    configure :name do
      label "Название"
    end
    configure :subdomain do
      label "Содержимое"
    end
    configure :permalink do
      label "Пермалинк(ЧПУ)"
    end
    configure :preview_text do
      label "Текст превью"
    end
    configure :city do
      label "Город"
    end

    list do

      field :name
      field :city
      field :preview_text
      field :created_at do
        label "Создан"
      end
      field :updated_at do
        label "Изменен"
      end
    end

    edit do
      field :title
      field :name
      field :city
      field :preview_text
      field :content, :text do
        ckeditor true
      end
      field :permalink
      field :meta_description
      field :meta_keywords
      field :image
    end
  end


  #модель Order - заявки и жалобы
  config.model Order do

    configure :title do
      label "Заголовок"
    end
    configure :name do
      label "Название"
    end
    configure :subdomain do
      label "Содержимое"
    end
    configure :preview_text do
      label "Текст превью"
    end
    configure :city_str do
      label "Город"
    end

    list do
      field :name do
        label "Имя"
      end
      field :city_str do
        label "Город"
      end
      field :email
      field :title do
        label "Заголовок"
      end
      field :content do
        label "Содержимое"
      end
    end
  end

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  require 'i18n'
  I18n.default_locale = :ru

  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Бизнес-Альянс', 'Администрирование']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
   config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = []

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = []

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

end
