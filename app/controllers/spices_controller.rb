class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message
  wrap_parameters format: []

  def index
    spices = Spice.all
    render json: spices
  end

  def create
    new_spice = Spice.create(spice_params)
    render json: new_spice, status: :created
  end

  def update
    spice = Spice.find(params[:id])
    spice.update(spice_params)
    render json: spice, status: :accepted
  end

  def destroy
    spice = Spice.find(params[:id])
    spice.destroy
    head :no_content
  end

  private

  def record_not_found_message
    render json: { error: "Record not found" }
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end
