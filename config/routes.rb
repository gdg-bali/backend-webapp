# frozen_string_literal: true

Rails.application.routes.draw do
  # A performance dashboard for Postgres
  # mount PgHero::Engine, at: 'pghero' if Rails.env.development?

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'events' => 'events#index'
    end
  end
end
