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

      def volunteer_params
        params.require(:data).permit(:registered_at, :reasons)
      end

      def user_params
        params.require(:data).except(:is_volunteer).permit(:name, :email, :phone)
      end

      def fetch_volunteer
        @volunteer = Volunteer.find_or_initialize_by(user: @current_user)
        return @volunteer if @volunteer.persisted?

        @volunteer = Volunteer.new(volunteer_params)
        @volunteer.user = @current_user
      end
    end
  end
end
