# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < ApiController
      def show
        render json: @current_user, attends_at: true, status: 200
      end
    end
  end
end
