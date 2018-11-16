module V1
  class Attendees < Base
    include ::Helpers::AuthHelpers

    resource :attendees do
      params do
        requires :user, type: JSON
        requires :attendee, type: JSON do
          requires :eventId, type: String
          requires :registeredAt, type: String
        end
      end
      post do
        attendee_params = declared(params)[:attendee].transform_keys { |key| key.to_s.underscore }
        fetch_user(declared(params)[:user])
        fetch_attendee(attendee_params)

        if @attendee.save && @user.save
          present @attendee, with: Entities::Attendee
        else
          error!(@attendee.errors, 422)
        end
      end
    end

    helpers do
      def fetch_user(user_params)
        if request.headers['Authorization'].present?
          authenticate!
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

      def fetch_attendee(attendee_params)
        @attendee = Attendee.find_or_initialize_by(user: @user)
        return @attendee if @attendee.persisted?

        @attendee = Attendee.new(attendee_params)
        @attendee.user = @user
      end
    end
  end
end
