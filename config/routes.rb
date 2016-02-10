Rails.application.routes.draw do
    
  resources :obat_masuks
  resources :reseps
  resources :rekam_mediks
  resources :kunjungans
  resources :pasiens
  resources :kartu_rms
  resources :penyakits
  resources :obats
  resources :jenis_penyakits
  resources :jenis_kartus
  resources :kelurahans
  resources :polis
  resources :kategoris
    root 'sessions#new'

    get '/help' =>'static_pages#help'
    get '/home' =>'static_pages#home'
    get '/signup' => 'admins#new'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
    get 'search_pasien' => 'pasiens#search'
    get 'search_obat_masuk' => 'obats#search_obat_masuk'
    get 'search_obat_keluar' => 'obats#search_obat_keluar'
    get 'cetak_rekam_medik' => 'pasiens#rekam_medik'
    get 'cetak_resep' => 'reseps#cetak_resep'
  resources :admins


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
