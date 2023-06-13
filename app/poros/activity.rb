class Activity
  attr_reader :destination, :forecast, :activities, :id

  def initialize(forecast_data, activities_data)
    @id = nil
    @destination = forecast_data[:destination]
    @forecast = forecast_data[:forecast]
    @activities = activities_data[:activities]
  end

#   def determine_activities(temperature)
#     if temperature >= 60
#       add_recreational_activity
#     elsif temperature >= 50 && temperature < 60
#       add_busywork_activity
#     else
#       add_cooking_activity
#     end
#   end

#   private

#   def add_recreational_activity
#     response = ActivityService.new.get_recreational_activity
#     activities[:recreational] = response
#   end

#   def add_busywork_activity
#     response = ActivityService.new.get_busywork_activity
#     activities[:busywork] = response
#   end

#   def add_cooking_activity
#     response = ActivityService.new.get_cooking_activity
#     activities[:cooking] = response
#   end

#   def parse_activity_response(response)
#     JSON.parse(response.body, symbolize_names: true)
#   end
end