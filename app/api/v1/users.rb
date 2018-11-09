module V1
  class Users < Base
    include ::Helpers::AuthHelpers

    resource :users do
      get '/profile' do
        authenticate!
        present @current_user, with: Entities::User, profile: true
      end

      get '/validate' do
        authenticate!
        present @current_user, with: Entities::User
      end
    end
  end
end
