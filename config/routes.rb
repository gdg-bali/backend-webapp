# frozen_string_literal: true

Rails.application.routes.draw do
  # A performance dashboard for Postgres
  # mount PgHero::Engine, at: 'pghero' if Rails.env.development?

  post '/auth/:provider/callback', to: 'sessions#create'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'events' => 'events#index'
      get 'events/:slug_url' => 'events#show'
    end
  end
end
