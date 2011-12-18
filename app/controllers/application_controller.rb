class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_guest
  
  def current_guest
  	@guest ||= Guest.find cookies[:guest_id] if cookies[:guest_id]
  end
end
