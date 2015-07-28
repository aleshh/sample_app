module SessionsHelper

  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # if @current_user.nil?
  #   @current_user = User.find_by(id: session[:user_id])
  # else
  #   @current_user
  # end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil? # wouldn't "!!current_user" also work?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
