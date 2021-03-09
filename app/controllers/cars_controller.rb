class CarsController < ApplicationController

  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
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
  end

  def car_params
    params.require(:car).permit(:brand, :description, :price, :user_id) #photo upload need to install cloudinary
  end
end
