Rails.application.routes.draw do

  #Main Application Controllers routes
  root    'static_pages#home'
  get      '/signup',  to: 'users#new'
  post     '/signup',  to: 'users#create'
  get      '/about',   to: 'static_pages#about'
  get      '/login',   to: 'sessions#new'
  post     '/login',   to: 'sessions#create'
  delete   '/logout',  to: 'sessions#destroy'
  get      '/publications',  to: 'static_pages#publications'
  get      '/projects',   to: 'static_pages#projects'
  dynamic_pages =  ["dashboard", "charts_data", "export_tables", "alerts"]
  dynamic_pages.each do |page|
    get "/users/:id/#{page.gsub("_","/")}", to: "dynamic_pages##{page}", as: page.to_sym
  end
  resources :users, only: [:update, :edit, :show]

  #route for generating measurements via HTTP GET - TELEMETRY
  get '/measurements/electrical/new', to:'measurements#new_electrical'
  get '/measurements/internal_conditions/new', to:'measurements#new_internal_conditions'
  get '/measurements/meteorological/new', to:'measurements#new_meteorological'
  get '/measurements/wind_turbine_speed/new', to:'measurements#new_wind_turbine_speed'
  get '/measurements/wind_turbine_vibration/new', to:'measurements#new_wind_turbine_vibration'
  get '/measurements/meteorological/new/wunderground', to:'measurements#new_wunderground'
  get '/measurements/training_data/new', to:'measurements#new_training_data'
  get '/stream/new', to:'measurements#new_stream'
  get '/measurements/panel_conditions/new', to:'measurements#new_panel_conditions'

  #routes for AJAX Calls controller
  get '/load_electrical', to: 'ajax_calls#load_electrical', as: :load_electrical
  get '/load_metereological', to: 'ajax_calls#load_metereological', as: :load_metereological
  get '/load_internal', to: 'ajax_calls#load_internal', as: :load_internal
  get '/load_panel', to: 'ajax_calls#load_panel', as: :load_panel
  get '/load_stream', to: 'ajax_calls#load_stream', as: :load_stream
  get '/voltage_chart', to: 'ajax_calls#voltage_chart', as: :voltage_chart
  get '/energy_chart', to: 'ajax_calls#energy_chart', as: :energy_chart
  get '/wind_chart', to: 'ajax_calls#wind_chart', as: :wind_chart
  get '/hsp_chart', to: 'ajax_calls#hsp_chart', as: :hsp_chart
  get '/temperature_chart', to: 'ajax_calls#temperature_chart', as: :temperature_chart
  get '/radiation_chart', to: 'ajax_calls#radiation_chart', as: :radiation_chart
  get '/temperature_historic', to: 'ajax_calls#temperature_historic', as: :temperature_historic
  get '/speed_historic', to: 'ajax_calls#speed_historic', as: :speed_historic
  get '/radiation_historic', to: 'ajax_calls#radiation_historic', as: :radiation_historic
  get '/vibration_x_historic', to: 'ajax_calls#vibration_x_historic', as: :vibration_x_historic
  get '/vibration_y_historic', to: 'ajax_calls#vibration_y_historic', as: :vibration_y_historic
  get '/vibration_z_historic', to: 'ajax_calls#vibration_z_historic', as: :vibration_z_historic

  get '/refresh_checkboxes_tables', to: 'ajax_calls#refresh_checkboxes_tables', as: :refresh_checkboxes_tables
  get '/refresh_table', to: 'ajax_calls#refresh_table', as: :refresh_table

  #routes for alerts
  post '/users/:id/alerts/new', to: 'ajax_calls#new_alert', as: :new_alert
  get '/refresh_alert_list', to:'ajax_calls#refresh_alert_list', as: :refresh_alert_list
  delete '/delete_alert', to: 'ajax_calls#delete_alert', as: :delete_alert

  #routes for notifications
  get '/source/:id/notifications/new', to:'measurements#new_notification', as: :new_notification
  get '/check_new_notifications', to: 'ajax_calls#check_new_notifications', as: :check_new_notifications
  get '/refresh_notification_list', to:'ajax_calls#refresh_notification_list', as: :refresh_notification_list
  delete '/delete_notification', to: 'ajax_calls#delete_notification', as: :delete_notification

  #HTTP error codes
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  match "/500" => "errors#error500", via: [ :get, :post, :patch, :delete ]
  match "/403" => "errors#error403", via: [ :get, :post, :patch, :delete ]

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
