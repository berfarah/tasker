Rails.application.routes.draw do
  resources :emails
  resources :logs, only: [:index, :show] do
    collection do
      get 'errors'
    end
  end

  get 'tasks/external' => 'tasks#external'
  resources :tasks, path: '/' do
    resources :instances, shallow: true, only: [:show, :index] do
      resources :logs, only: [:index]
    end
  end

end
