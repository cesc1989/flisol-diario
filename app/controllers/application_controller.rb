class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Para usar en Github Codespaces:
  #
  #  - descomenta la línea skip_before_action
  #  - comenta la línea protect_from_forgery

  # skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end
end
