class Api < Grape::API
  prefix :api
  version 'v1', using: :path
  format :json
  helpers Pundit
  mount V1::Base
end
