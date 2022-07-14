class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %i[show edit update destroy]

  # New restaurant
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  # Show restaurants
  def index
    @restaurants = Restaurant.all
  end

  # Show a restaurant
  def show
    unless defined?(@review)
      @review = Review.new
      @review.restaurant = @restaurant
    end
  end

  # Edit restaurants
  def edit; end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  # Destroy restaurant
  def destroy
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
