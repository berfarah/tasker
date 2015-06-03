Rails.application.routes.draw do
  resources :logs, only: [:index, :show]

  resources :tasks, path: '/' do
    resources :instances, shallow: true, only: [:show, :index] do
      resources :logs, only: [:index]
    end
  end
end
