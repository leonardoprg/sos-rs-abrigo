Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :volunteers
  resources :sheltereds
  resources :work_schedules do
    resources :volunteer_work_schedules
  end
  resources :reports, only: [] do
    get :sheltereds, on: :collection
  end
end
