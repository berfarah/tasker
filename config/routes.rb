Rails.application.routes.draw do
  resources :emails
  resources :logs, only: [:index, :show] do
    collection do
      get 'errors'
      get 'range/:date' => 'logs#range', as: :range
    end
  end

  resources :tasks, path: '/' do
    collection do
      post 'external'
    end

    resources :instances, shallow: true, only: [:show, :index] do
      resources :logs, only: [:index]
    end
  end
end
