RailsApp::Application.routes.draw do

  get "galleries/show"

  get "admin_resource/copy"

  get "city/chose"



  resources :articles
  #get "main/index"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  match "/admin/:model_name/cpr/copy_resource" => "custom_admin#copy_resource" , :as => "copy_resource", :via => [:get, :post]
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users

  match '/page/:id' => "pages#show", as: :page
  match '/article/:id' => "articles#show", as: :article
  get 'portfolio', :to => 'galleries#show', :as => :portfolio
  get 'copies', :to => "main#copy"
  post 'vacancies/create', :to => "vacancies#create"
  get 'news', :to => "tidings#index"
  get 'news/:id', :to => "tidings#show"
  get 'new_complaint', :to => 'orders#new_complaint'
  get '/orders/new', :to => "orders#new"
  post 'create_complaint', :to => 'orders#create_complaint'
  #post 'orders_create', :to => 'orders#create'
  match 'choose_town', :to => "main#choose_town"
  match 'choose', :to => "main#choose"
  root :to => 'main#choose'
  match ':controller(/:action(/:id))(.:format)'
end
