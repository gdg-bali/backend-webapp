# frozen_string_literal: true

module Api
  module V1
    class AttendeesController < ApiController
      skip_before_action :authorize_request

      def create
        fetch_user
        fetch_attendee

        if @attendee.save && @user.save
          json_response(AttendeeSerializer.new(@attendee, include: %i[user]), :created)
        else
          json_response(@attendee.errors, 422)
        end
      end

      private

      def attendee_params
        params.require(:data).permit(:registered_at, :event_id)
      end

      def user_params
        params.require(:data).require(:user).permit(:name, :email, :phone, :institution)
      end

      def fetch_user
        if request.headers['Authorization'].present?
          authorize_request
          @user = @current_user
          @user.attributes = user_params
        else
          @user = User.find_by(email: user_params[:email])
          if @user.present?
            @user.attributes = user_params
          else
            @user = User.new(user_params)
          end
        end
      end

      def fetch_attendee
        @attendee = Attendee.find_or_initialize_by(user: @user)
        return @attendee if @attendee.persisted?

        @attendee = Attendee.new(attendee_params)
        @attendee.user = @user
      end
    end
  end
end
