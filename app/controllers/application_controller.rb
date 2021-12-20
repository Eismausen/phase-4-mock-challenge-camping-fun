class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_invalid_record
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  private

  def rescue_invalid_record(exception)
    render json: {"errors": exception.record.errors.full_messages}, status: :unprocessable_entity
  end

  def rescue_record_not_found(exception)
    render json: {"error": "#{exception.model} not found"}, status: :not_found
  end

end
