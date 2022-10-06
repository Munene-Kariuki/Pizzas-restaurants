class RestaurantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_restaurant_not_found

  def index 
    render json: Restaurant.all
  end 
  
  def show 
    restaurant = find_restaurant 
    render json: restaurant, include: :pizzas
  end 

  private 
  def find_restaurant 
    Restaurant.find(params[:id]) 
  end

  def render_restaurant_not_found 
    render json: {error: "Restaurant not found"}, status: :not_found 
  end

end
