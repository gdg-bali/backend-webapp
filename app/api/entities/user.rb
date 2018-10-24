module Entities
  class User < Entities::Base
    expose :name, :email, :phone, :institution
    expose :avatar_url, as: :avatarUrl
  end
end