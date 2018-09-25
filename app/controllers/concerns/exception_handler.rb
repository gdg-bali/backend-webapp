module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    rescue_from ActiveRecord::RecordNotFound do |err|
      json_response({ message: 'Does not exists' }, :not_found)
    end
  end

  private

  def unprocessable(err)
    json_response({ message: err.message }, :unprocessable_entity)
  end
end