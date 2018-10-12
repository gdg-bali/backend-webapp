# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      def create
        if params[:data][:is_volunteer]
          @current_user.roles = [:volunteer]
          @current_user.attributes = user_params.except(:reasons)
          reasons = {
            volunteer: user_params[:reasons]
          }
          @current_user.reasons = reasons

          if @current_user.save
            json_response(@current_user)
          else
            json_response(@current_user.errors, 422)
          end
        end
      end

      private

      def user_params
        params.require(:data).except(:is_volunteer).permit(:name, :email, :phone, :reasons)
      end
    end
  end
end
