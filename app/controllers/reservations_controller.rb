class ReservationsController < ApplicationController
  before_filter :load_restaurant

  def index
    @reservations = Reservation.all
  end

  def new
  	@reservation = Reservation.new
  end

  def show
  	@reservation = Reservation.find_by(id: params[:id])
  end

  def create
  	@reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user

  	if @reservation.save
  		redirect_to restaurant_reservations_path
  	else
  		render :new
  	end
  end

  def edit
  	@reservation = Reservation.find_by(id: params[:id])
  end

  def update
  	@reservation = Reservation.find_by(id: params[:id])

  	if @reservation.update_attributes(reservation_params)
  		redirect_to reservation_path(@reservation)
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
