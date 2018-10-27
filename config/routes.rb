# frozen_string_literal: true

Rails.application.routes.draw do
  # A performance dashboard for Postgres
  # mount PgHero::Engine, at: 'pghero' if Rails.env.development?

  mount Api => '/'

  post '/auth/:provider/callback', to: 'sessions#create'
end
