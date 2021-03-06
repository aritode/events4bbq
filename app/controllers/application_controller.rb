class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?, :current_user_can_subscribe?,
                :current_user_subscribed?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password)
    }
  end

  def current_user_can_subscribe?(event)
    !current_user_can_edit?(event)
  end

  def current_user_subscribed?(event)
    event.subscriptions.map(&:user_id).include? current_user.id if current_user.present?
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
        (model.user == current_user ||
            # если у модели есть юзер и он залогиненный
            # пробуем у модели взять .event и если он есть, проверяем его юзера
            (model.try(:event).present? && model.event.user == current_user))
  end
end
