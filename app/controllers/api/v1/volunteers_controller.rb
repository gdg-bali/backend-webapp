# frozen_string_literal: true

module Api
  module V1
    class VolunteersController < ApiController
      def create
        fetch_volunteer
        @current_user.attributes = user_params

        if @volunteer.save && @current_user.save
          json_response(VolunteerSerializer.new(@volunteer, include: %i[user]), :created)
        else
          json_response(@volunteer.errors, 422)
        end
      end

      private

      w
    end
  end
end
