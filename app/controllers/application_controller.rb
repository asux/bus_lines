class ApplicationController < ActionController::API
  before_action :set_default_format

  protected

  def set_default_format
    request.format = :json unless params[:format]
  end

  def render_errors(record)
    render json: { errors: record.errors }, status: :unprocessable_entity
  end
end
