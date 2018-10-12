module OmniauthRegisterable
  extend ActiveSupport::Concern

  module ClassMethods
    def find_for_oauth(auth, user = nil)
      identity = Identity.find_or_initialize_for_oauth(auth)

      user ||= identity.user

      user ||= find_or_create_user_for_oauth(auth, identity)
      associate_identity_with_user(identity, user)

      user
    end

    private
      def associate_identity_with_user(identity, user)
        if identity.user != user
          identity.user = user
          identity.save!
        end
      end

      def find_or_create_user_for_oauth(auth, identity)
        user = User.find_by(email: auth.info.email)
        user || create_user_for_oauth!(auth, identity)
      end

      def create_user_for_oauth!(auth, identity)
        auth_info = auth.info

        user = User.new({
          name: "#{auth_info.first_name} #{auth_info.last_name}",
          email: auth_info.email,
          avatar_url: auth_info.image
        })
        user.identities.push(identity)

        user.save!
        user
      end
  end
end
