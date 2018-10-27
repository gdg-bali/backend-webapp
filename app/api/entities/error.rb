module Entities
  class Error < Grape::Entity
    expose :status, documentation: { type: String, desc: 'HTTP status code'}
    expose :code, documentation: { type: String, desc: 'App-specific error code'}
    expose :message, documentation: { type: String, desc: 'Description of error'}
  end
end