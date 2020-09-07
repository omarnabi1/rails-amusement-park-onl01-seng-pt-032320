class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  before_action :verified_user


def verified_user
  redirect_to '/' unless logged_in
end  


def current_user
    User.find_by(id: session[:user_id])
end

def logged_in
    !!current_user
  
end

end