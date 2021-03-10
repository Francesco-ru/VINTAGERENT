class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :destroy]

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
    authorize @booking
  end

  def show

  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car_id = params[:car_id]
    @booking.user_id = current_user.id
    authorize @booking
    if @booking.save
      redirect_to car_path(@car), notice: "Reserve car confirmed!"
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to cars_path
  end

  private

  # def set_car
  #   @car = Car.find(params[:car_id])
  #   authorize @car
  # end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
