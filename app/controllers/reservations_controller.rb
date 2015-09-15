class ReservationsController < ApplicationController
  before_filter :load_restaurant

  def index
    @reservations = @restaurant.reservations
  end

  def new
  	@reservation = Reservation.new
  end

  def show
  	@reservation = Reservation.find_by(id: params[:id])
  end

  def create
    if current_user
    	@reservation = @restaurant.reservations.build(reservation_params)
      @reservation.user_id = current_user.id

    	if @reservation.save
    		redirect_to restaurant_reservations_path
    	else
        flash[:alert] = "This restaurant is at capacity for this time. We suggest trying another time"
    		render :new
    	end

    else
      flash[:alert] = "You are not logged in."
      redirect_to new_session_path
    end
  end

  def edit
  	@reservation = Reservation.find_by(id: params[:id])
  end

  def update
  	@reservation = Reservation.find_by(id: params[:id])

  	if @reservation.update_attributes(reservation_params)
  		redirect_to user_path(@reservation.user_id)
  	else
  		render :edit
  	end
  end

  def destroy
  	@reservation = Reservation.find_by(id: param[:id])
  	@reservation.destroy
  	redirect_to root_path
  end

  private

  def reservation_params
  	params.require(:reservation).permit(:dinner_time, :partysize)
  end

   def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
