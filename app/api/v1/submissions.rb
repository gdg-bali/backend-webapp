module V1
  class Submissions < Base
    include ::Helpers::AuthHelpers

    resource :submissions do
      params do
        requires :reasons, type: String
        requires :submissionType, type: String
      end
      post do
        authenticate!
        build_submission

        if @submission.save
          status :ok
        else
          error!(@submission.errors, 422)
        end
      end
    end

    helpers do
      def submission_params
        declared(params).transform_keys { |key| key.to_s.underscore }
      end

      def build_submission
        @submission = Submission.new
        @submission.reasons = { reasons: submission_params[:reasons] }
        @submission.submission_type = submission_params[:submission_type]
        @submission.user = @current_user
      end
    end
  end
end
