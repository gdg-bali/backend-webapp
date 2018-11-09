module Entities
  class User < Entities::Base
    expose :name, :email, :phone, :institution
    expose :avatar_url, as: :avatarUrl
    expose :roles_mask, as: :rolesMask

    expose :attendsAt, if: lambda { |_, options| options[:profile] } do |user|
      user.attends_at.future.map { |att| { id: att.id, name: att.name } }
    end
  end
end