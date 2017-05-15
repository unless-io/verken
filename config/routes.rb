Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: 'pages#home'
  
  resource :dashboard, only: [:show, :edit, :update]

  namespace :dashboard do
    resources :explorations, except: [:index, :new] do
      collection do
        get :results
        post :join
        delete :leave
      end
      resources :items, except: [:index] do
        resources :links, only: [:create, :update, :destroy]
        resources :evaluations, only: [:create, :update, :destroy]
      end
      resources :criteria, except: [:index, :show, :new]
    end
  end
end
