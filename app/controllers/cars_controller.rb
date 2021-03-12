class CarsController < ApplicationController

  before_action :set_car, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      @cars = policy_scope(Car).search_by_brand_and_description(params[:query])
      @markers = @cars.geocoded.map do |car|
        {
          lat: car.latitude,
          lng: car.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { car: car }),
          image_url: helpers.asset_url('car.svg')
        }
      end
    else
      @cars = policy_scope(Car).all
      @markers = @cars.geocoded.map do |car|
        {
          lat: car.latitude,
          lng: car.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { car: car }),
          image_url: helpers.asset_url('car.svg')
        }
      end
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(car_params)
    authorize @car
    # @car.user = current_user
    @car.user_id = current_user.id
    if @car.save
      redirect_to car_path(@car)
    else
      raise
      render :new
    end
  end

  def edit
  end

  def update
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end

  def car_params
    params.require(:car).permit(:brand, :description, :price, :address, photos: []) #photo upload need to install cloudinary
  end
end
