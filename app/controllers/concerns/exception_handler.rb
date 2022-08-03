module ExceptionHandler 
    extend ActiveSupport::Concern

    included do
        rescue_from ActiveRecord::RecordNotFound do |exception|
            render json: { status: 'error', message: exception.message}
        end

        rescue_from ActiveRecord::RecordInvalid do |invalid|
            render json: invalid.record, adapter: :json_api,
            serializer: ErrorSerializer,
            status: :unprocessable_entity
        end
    end
end