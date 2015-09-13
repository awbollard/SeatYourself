class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def show
  	@restaurant = Restaurant.find_by(id: params[:id])
  end

  def edit
  	@restaurant = Restaurant.find_by(id: params[:id])
  end

  def create
  	@restaurant = Restaurant.new(restaurant_params)

  	if @restaurant.save
  		redirect_to restaurants_path
  	else
  		render :new
  	end
  end

  def update
    @restaurant = Restaurant.find_by(id: params[:id])

    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant.destroy
    redirect_to root_path
  end

  private
  def restaurant_params
  	params.require(:restaurant).permit(:name, :capacity, :address, :opening_time, :closing_time, :city, :price, :description)
  end
end