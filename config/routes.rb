Rails.application.routes.draw do
  devise_for :users, path: '',
                     controllers: { sessions: 'sessions' },
                     defaults: { format: :json }

  resource :users, only: %w[create] do
    patch :favorite_city
  end

  get '/weather', to: 'weather#index'
end
