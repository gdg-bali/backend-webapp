module Helpers
  module DefaultsHelpers
    attr_reader :current_user

    def declared_params
      declared(params)
    end

    def declared_params_with_user
      declared_params.merge(user_id: current_user.id)
    end

    # def present_collection(context, with:)
    #   paged_records = paginate(context)
    #   present :total_count, paged_records.total_count
    #   present :total_pages, paged_records.total_pages
    #   present :page, paged_records.current_page
    #   present paged_records, with: with
    # end
    #
    # def custom_invalid_error!(msg = 'Invalid record error')
    #   render_error!('invalid_record_error', msg, 406)
    # end
    #
    # def paginate(context)
    #   context.page(params[:page]).per(params[:per_page])
    # end
  end
end