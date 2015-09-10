class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)

  	if @user.save
  		redirect_to user_path(@user)
  	else
  		render :new
  	end
  end

  def show
  	@user = User.find_by(id: params[:id])
  end

  def edit
  	@user = User.find_by(id: params[:id])
  end

  def update
  	@user = User.find_by(id: params[:id])

  	if @user.update_attributes(user_params)
  		redirect_to user_path(@user)
  	else
  		render :edit
  	end
  end

  def destroy
  	@user = User.find_by(id: params[:id])
  	@user.destroy
  	redirect_to '/users/new'
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
