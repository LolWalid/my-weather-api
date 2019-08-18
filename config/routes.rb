Rails.application.routes.draw do
  devise_for :users, path: '',
                     controllers: { sessions: 'sessions' },
                     defaults: { format: :json }

  resource :users, only: %w[create update show]
end
