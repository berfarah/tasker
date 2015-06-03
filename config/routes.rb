Rails.application.routes.draw do
  resources :logs
  resources :instances

  resources :tasks, path: '/' do
    get 'instances' => 'tasks#instances'
  end
end
