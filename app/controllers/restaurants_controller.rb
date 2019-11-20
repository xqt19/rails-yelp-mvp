class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find([params[:id]])[0]
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @new_restaurant = Restaurant.new(restaurant_params)
    if @new_restaurant.save
      redirect_to root_path
    else
      @restaurant = Restaurant.new
      render :new
    end
  end

  private

  def restaurant_params
    params.require("restaurant").permit(:name, :address, :category, :phone_number)
  end

end
