# The main application controller from which all other controllers
# inherit. In lieu of an errors controller, this controller is being
# used to handle errors.
class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from 'Apipie::ParamMissing', with: :handle_error
  rescue_from 'Apipie::ParamInvalid', with: :handle_error

  def forem_user
    current_user
  end
  helper_method :forem_user

  private

  def handle_error(exception)
    respond_to do |format|
      handle_response(exception, format)
    end
  end

  def handle_response(exception, format)
    format.json do
      render json: { errors: exception.to_s }, status: :bad_request
    end
    format.html do
      render json: { errors: exception.to_s }, status: :bad_request
    end
  end
end
