Rails.application.routes.draw do
  resources :pontos
  resources :trocas
  resources :produtos
  resources :clientes do
    member do
      get 'edit_password'
      patch 'update_password'
    end 
  end
  devise_for :funcionarios, path: 'auth'
  resources :funcionarios
  resources :categorias
  root "application#index"

  scope :api, defaults: { format: :json } do
    devise_for :clientes,
      controllers: {
        sessions: 'api/sessions',
        passwords: 'api/passwords'
      }
  end
  namespace :api do
    resources :clientes, only: [:update] do
      member do
        patch 'update_password'
      end
      collection do
        get 'token'
      end
    end
    resources :trocas, only: [:create, :index] do
      member do
        put 'cancelar'
      end
    end
    resources :produtos, only: [:index]
  end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

