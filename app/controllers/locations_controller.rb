class LocationsController < ApplicationController

  def index
    # NO bussiness logic to display on index page
  end

  def coordinates
    location = Location.geo_coordinates(params[:address])

    respond_to do |format|
      format.json { render json: location.present? ? { location: location, success: true }.to_json : { success: false }.to_json, layout: false }
    end
  end

  def create
    location = Location.new(location_params)

    respond_to do |format|
      format.json { render json: { success: location.save }.to_json, layout: false }
    end
  end

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end
end
