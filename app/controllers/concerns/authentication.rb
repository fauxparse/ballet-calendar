module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :logged_in?, :current_user
  end

  private

  def logged_in?
    current_user.present?
  end

  def current_user
    @current_user ||= current_user_id && Teacher.find(current_user_id)
  end

  def current_user_id
    session[:current_user]
  end

  def log_in_as(user)
    session[:current_user] = user.id
  end

  def log_out
    session.delete(:current_user)
  end
end
