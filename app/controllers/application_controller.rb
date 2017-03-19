class ApplicationController < ActionController::Base
	#before_filter :authenticate_user!
  protect_from_forgery with: :exception
  #check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end
end
