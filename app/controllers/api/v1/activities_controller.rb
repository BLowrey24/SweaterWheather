class Api::V1::ActivitiesController < ApplicationController
  def index
    render json: ActivitySerializer.new(WeatherFacade.new(params[:destination]).activities_by_location)
  end
end

# if params[:location].present?
#   render json: ActivitySerializer.new(WeatherFacade.new(params[:location]).activities_by_location)
# else
#   render json: ErrorSerializer.serialize("Invalid location or not given"), status: 400
# end