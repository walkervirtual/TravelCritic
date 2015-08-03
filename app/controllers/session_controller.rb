class SessionController < ApplicationController
	
	def create
    user = User.find_by_username(params[:username])
    if user
      if user.password == params[:password]
        session[:user_id] = user.id
        flash[:welcome] = "Welcome to Nneoma'Wallet"
        redirect_to users_path
      end
    else
      flash[:alert] = "Invalid Credentials"
      redirect_to new_session_path
    end
end
