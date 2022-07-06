class ApplicationController < ActionController::Base
  
  include SessionsHelper

  private

  def require_user_login
    unless login?
      redirect_to login_url
    end
  end
  
end
