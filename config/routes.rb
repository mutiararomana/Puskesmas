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
    get 'lb2' => 'obats#laporan'
    get 'lb1' => 'pasiens#laporan'
  resources :admins

end
