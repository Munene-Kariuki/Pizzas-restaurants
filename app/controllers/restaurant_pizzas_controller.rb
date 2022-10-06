class RestaurantPizzasController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record_response

  def create 
    restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params) 
    render json: restaurant_pizza.pizza, status: :created 
  end 

  private 
  def restaurant_pizza_params 
    params.permit(:price, :restaurant_id, :pizza_id) 
  end

  def render_invalid_record_response(exception)
    render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
  end

end
