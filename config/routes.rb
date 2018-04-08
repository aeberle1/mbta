Rails.application.routes.draw do
  get 'schedule/index'

  root 'schedule#index'

  resources :schedule

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
