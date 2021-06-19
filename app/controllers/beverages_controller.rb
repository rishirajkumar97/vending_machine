# frozen_string_literal: true

# Beverages Controller to Get / Show/ Create new Beverages
class BeveragesController < ApplicationController
  # Index method to get all the beverages
  def index
    beverages = Beverage.all
    render json: {
      items: ActiveModelSerializers::SerializableResource.new(beverages),
      total_results: beverages.count
    }
  end

  # create method to post a new Beverages to the database
  def create
    render json: Beverage.create!(beverage_post_params), status: :created
  end

  # show Method to revtrieve a single Beverage by ID
  def show
    params.require(%i[id])
    render json: Beverage.find_by(id: params[:id])
  end
end
