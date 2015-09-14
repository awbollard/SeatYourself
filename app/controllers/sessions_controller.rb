class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to show_user_path
  	else 
  		flash.now[:alert] = "You can do better than that. Incorrect UN/Pass. "
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to posts_path, notice: "Logged out, suckaa"
  end
end