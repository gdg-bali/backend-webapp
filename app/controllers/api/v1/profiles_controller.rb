# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < ApiController
      def show
        json_response(@current_user)
      end
    end
  end
end
