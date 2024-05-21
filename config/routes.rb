Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :volunteers
  resources :sheltereds do
    resources :sheltered_medical_logs, only: [:create]
  end
  resources :work_schedules do
    resources :volunteer_work_schedules
  end
  resources :reports, only: [] do
    get :sheltereds, on: :collection
  end
  resources :items do
    get :search, on: :collection
  end
end
