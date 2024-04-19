require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'

    namespace :admin do
    end
  end

  namespace 'api', default: { format: 'json' }, path: '/' do
    namespace :v1 do
    end
  end
end
