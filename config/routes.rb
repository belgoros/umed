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
  resources :levels
  resources :plans
  resources :subscriptions, except: [:update, :edit] do
    get 'express_checkout', on: :new
  end

  resources :quizzes, only: [:create, :index, :destroy] do
    get 'details', on: :member
    resources :steps, only: [:show, :update], controller: 'quiz/steps'
    resources :questions, only: [:show, :update], controller: 'quiz/questions'
  end

  resource :contact, only: [:new, :create]
  get 'faq', to: 'home#faq'
  get 'about', to: 'home#about'
  get 'credits', to: 'home#credits'
end
