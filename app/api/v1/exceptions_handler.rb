module V1
  module ExceptionsHandler
    extend ActiveSupport::Concern

    included do
      rescue_from :all do |e|
        case e.class.name
        when 'Grape::Exceptions::ValidationErrors'
          render_error!('validation_error', e.message, 422)
        when 'Pundit::NotAuthorizedError'
          render_error!('forbidden_error', 'Unauthorized', 403)
        when 'ActiveRecord::RecordInvalid'
          render_error!('invalid_record_error', e.message, 406)
        when 'ActiveRecord::RecordNotFound'
          render_error!('not_found_error', e.message, 404)
        else
          render_error!('server_error', e.message, 500)
        end
      end

      helpers do
        def render_error!(code, message, status)
          error!({ code: code, message: message, status: status, with: Entities::Error }, status)
        end
      end
    end
  end
end