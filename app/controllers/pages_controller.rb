class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
  end

  def profile
    @bookings = current_user.bookings
    @cars = current_user.cars
  end
end
