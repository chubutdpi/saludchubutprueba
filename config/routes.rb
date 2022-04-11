Rails.application.routes.draw do
  get 'busqueda_laboral' => 'busqueda_laboral#index'
  get 'plan_estrategico' => 'plan_estrategico#index'
  get 'plan_estrategico_download' => 'plan_estrategico#download_pdf'
  get 'vih_its' => 'vih_its#index' 
  get 'hidratacion_agua_segura' => 'hidratacion#index'
  get 'prevencion_suhyed' => 'prevencion_suhyed#index'
  get 'prevencion_de_accidentes' => 'prevencion_accidentes#index'
  get 'alimentacion_segura' => 'alimentacion_segura#index'
  get 'protegete_del_sol' => 'protegete_sol#index'
  get 'ola_de_calor' => 'ola_calor#index'
  get 'verano' => 'verano#index'
  get 'prestadores' => 'prestadores#index'
  get 'mvo' => 'mvo#index'
  get 'autoridades' => 'autoridades#index'
  get 'organigrama' => 'organigrama#index'
  get 'cud_certificate' => 'cud_certificate#index'
  
  get 'vacunacion_covid' => 'vacunacion_covid#index'
  resources :tabs
  resources :pages
  get 'vacunacion' => 'vacunacion#index'
  get 'hantavirus' => 'hantavirus#index'
  get 'organization_chart' => 'organization_chart#index'
  get 'covid' => 'covid#index'

  get 'como_se_transmite' => 'vih_its#como_se_transmite'
  get 'como_saber_si_tenes_vih' => 'vih_its#como_saber_si_tenes_vih'
  get 'como_es_el_tratamiento' => 'vih_its#como_es_el_tratamiento'

  resources :vaccination_schemes
  
  resources :notices
  
  resources :covid_situations
  
  resources :covid_current
  post 'covid_current/part_locality' => 'covid_current#part_locality', :as => :part_locality
  
  resources :localities
  resources :states
  resources :areas

  post '/get_acumulated/:locality_id/:part_date/:case_type/:new_value' => 'covid_situations#get_acumulated'

  devise_for :users
  root 'welcome#index'

  scope 'api' do
    scope 'v1' do
      resources :localities
    end
  end


end
