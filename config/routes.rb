Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :subjects, shallow: true do
    resources :themes, shallow: true, except: :index do
      resources :questions, shallow: true, except: :index do
        resources :answers, except: :index
      end
    end
  end

    resources :themes,    only: :index
    resources :questions, only: :index
    resources :answers,   only: :index
end
