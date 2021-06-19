# frozen_string_literal: true

class BeveragesController < ApplicationController
  def index
    beverages = Beverage.all
    render json: {
      items: ActiveModelSerializers::SerializableResource.new(beverages),
      total_results: beverages.count
    }
  end

  def create
    post_params = {
      beverage_name: params[:name]
    }
    render json: Beverage.create!(post_params), status: :created
  end
end
