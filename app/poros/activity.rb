class Activity
  attr_reader :destination, :forecast, :activities, :id

  def initialize(forecast_data, activities_data)
    @id = nil
    @destination = forecast_data[:destination]
    @forecast = forecast_data[:forecast]
    @activities = activities_data[:activities]
  end
end