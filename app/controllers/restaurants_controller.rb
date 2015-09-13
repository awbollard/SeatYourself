class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def show
  	@restaurant = Restaurant.find_by(:id, params[:id])
  end

  def edit
  	@restaurant = Restaurant.find_by(:id, params[:id])
  end

  def create
  	@restaurant = Restaurant.new(restaurant_params)

  	if @restaurant.save
  		redirect_to restaurants_path
  	else
  		render :new
  	end
  end

  def destroy
  end

  def update
  end

  private
  def restaurant_params
  	params.require(:restaurant).permit(:name, :capacity, :address, :opening_time, :closing_time, :city, :price, :description)
  end
end
