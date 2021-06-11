Rails.application.routes.draw do
  resources :venders
  resources :produtos
  resources :clientes
  devise_for :funcionarios, path: 'auth'
  resources :funcionarios
  resources :categorias
  root "application#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
