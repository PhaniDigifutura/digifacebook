class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    if user.blank?
    	redirect_to root_url, :bypass => true     	
    else
	    session[:user_id] = user.id
	    redirect_to root_url, :bypass => true 
	  end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end