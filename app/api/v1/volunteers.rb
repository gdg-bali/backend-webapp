module V1
  class Volunteers < Base
    resource :volunteers do
      params do
        requires :user, type: JSON do
          requires :name, type: String
          requires :email, type: String
          requires :phone, type: String
        end
        requires :volunteer, type: JSON do
          requires :reasons, type: String
          requires :registeredAt, type: String
        end
      end
      post do
        authenticate!
        fetch_volunteer
        @current_user.attributes = user_params
        @current_user.roles = @current_user.roles << :volunteer

        if @volunteer.save && @current_user.save
          status :ok
        else
          error!(@volunteer.errors, 422)
        end
      end
    end

    helpers do
      def volunteer_params
        declared(params)[:volunteer].transform_keys { |key| key.to_s.underscore }
      end

      def user_params
        declared(params)[:user]
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
