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
          if declared(params)[:user][:fromAdmin]
            present @attendee, with: Entities::EventAttendee
          else
            present @attendee, with: Entities::Attendee
          end
        else
          error!(@attendee.errors, 422)
        end
      end

      params do
        requires :eventId, type: String
      end
      get do
        authenticate!
        authorize :attendee, :index?
        event_id = declared(params)[:eventId]
        @attendees = Attendee.includes(:user).attending_at(event_id)
        present @attendees, with: Entities::EventAttendee
      end

      params do
        requires :userId, type: String
      end
      route_param :userId do
        get do
          user = User.find(declared(params)[:userId])
          present user, with: Entities::User
        end
      end

      params do
        requires :value, type: Boolean
        requires :id, type: String
      end
      put 'confirm' do
        authenticate!
        authorize :attendee, :confirm?
        @attendee = Attendee.find(declared(params)[:id])
        @attendee.confirmed_at = declared(params)[:value] ? Time.zone.now : nil
        @attendee.save!
        present @attendee, with: Entities::EventAttendee
      end
    end

    helpers do
      def fetch_user(user_params)
        if user_params[:fromAdmin]
          new_user(user_params.except(:fromAdmin))
        elsif request.headers['Authorization'].present?
          authenticate!
          @user = @current_user
          @user.attributes = user_params
        else
          new_user(user_params)
        end
      end

      def new_user(user_params)
        @user = User.find_by(email: user_params[:email])
        if @user.present?
          @user.attributes = user_params
        else
          @user = User.new(user_params)
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
