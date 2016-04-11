class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  attr_accessor :current_user
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(params[:user_id]) if params[:user_id]
  end
end
