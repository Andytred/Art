Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artworks do
    resources :transactions, only: [ :new, :create ]
  end

  resources :transactions, only: [ :index ] do
    get '/accept', to: 'transactions#accept'
    get '/reject', to: 'transactions#reject'
  end

end
