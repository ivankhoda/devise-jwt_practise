class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  respond_to :json
  private
  def respond_with(resource, _opts = {})
    p resource, 'resusrs'
    resource.persisted? ? register_success : register_failed
  end
  def register_success
    render json: { message: resource }
  end
  def register_failed
    render json: { message: resource.errors.full_messages }
  end
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:user, keys: [:email, :password, :password_confirmation])
    end
end
