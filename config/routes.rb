# frozen_string_literal: true

Rails.application.routes.draw do
  # A performance dashboard for Postgres
  mount PgHero::Engine, at: 'pghero' if Rails.env.development?
end
