Rails.application.routes.draw do

  #Main Application Controllers routes
  root    'static_pages#home'
  get      '/signup',  to: 'users#new'
  post     '/signup',  to: 'users#create'
  get      '/login',   to: 'sessions#new'
  post     '/login',   to: 'sessions#create'
  delete   '/logout',  to: 'sessions#destroy'
  dynamic_pages =  ["dashboard", "charts_data", "export_tables", "alerts"]
  dynamic_pages.each do |page|
    get "#{page.gsub("_","/")}/users/:id", to: "dynamic_pages##{page}", as: page.to_sym
  end
  resources :users, only: [:update, :edit, :show]

  #route for generating measurements via HTTP GET - TELEMETRY
  get '/measurements/electrical/new', to:'measurements#new_electrical'
  get '/measurements/internal_conditions/new', to:'measurements#new_internal_conditions'
  get '/measurements/meteorological/new', to:'measurements#new_meteorological'
  get '/measurements/meteorological/new/wunderground', to:'measurements#new_wunderground'
  get '/notifications/new'
  get '/stream/new', to:'measurements#new_stream'

  #routes for AJAX Calls controller
  get '/load_electrical', to: 'ajax_calls#load_electrical', as: :load_electrical
  get '/load_metereological', to: 'ajax_calls#load_metereological', as: :load_metereological
  get '/load_internal', to: 'ajax_calls#load_internal', as: :load_internal
  get '/load_stream', to: 'ajax_calls#load_stream', as: :load_stream
  get '/voltage_chart', to: 'ajax_calls#voltage_chart', as: :voltage_chart
  get '/energy_chart', to: 'ajax_calls#energy_chart', as: :energy_chart
  get '/wind_chart', to: 'ajax_calls#wind_chart', as: :wind_chart
  get '/hsp_chart', to: 'ajax_calls#hsp_chart', as: :hsp_chart
  get '/refresh_checkboxes_tables', to: 'ajax_calls#refresh_checkboxes_tables', as: :refresh_checkboxes_tables
  get '/refresh_table', to: 'ajax_calls#refresh_table', as: :refresh_table


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
