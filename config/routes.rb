Rails.application.routes.draw do
  get 'ads/index'
  root to: 'ads#index' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
