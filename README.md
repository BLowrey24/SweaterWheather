# Sweater Weather

Never let the weather on your Roadtrip catch you off gaurd again!
Sweater Weather is a weather an app where a user can see the current and forecasted weather of a specific location. 
A registered user can setup a roadtrip and see how long the trip will take as well as see the weather upon arriving to their chosen destination.

## <b>Getting Started</b>

1. Fork the and clone the repository
``` 
to clone suuccefully run (git clone git@github.com:BLowrey24/SweaterWheather.git) in your terminal
```
2. Navigate to the newly cloned repo and open it in your text editor of choice
3. Install the gems
```
install the gems by running (bundle install) in your terminal
```
4. Create the database
```
in your terminal now run (rails db:{drop,create,migrate})
```
5. Create application.yml
```
for this in your terminal you will run (bundle exec figaro install)
```
6. Add environment variables to application.yml file
``` 
in your application.yml file you can store your keys like so:
MAPQUEST_API_KEY: <your key here>
WEATHER_API_KEY: <your key here>
```
- Grab your Weather api key from https://www.weatherapi.com/
- Grab your MapQuest api key from https://developer.mapquest.com/documentation/ 

7. Run Tests in the terminal to verify everything was set up correctly
```
to run tests in your terminal run (bundle exec rspec)
```
- All tests should be passing
8. Run (rails s) from the terminal this should get your Rails Server going and to verify you can successfully hit the endpoints
```
9. Test the endpoints
- You can utilize Postman or VScodes Thunderclient to test the endpoints are running properly
- Append `http://localhost:3000` to each of the endpoints listed below.
```
## Endpoints
```
  get 'api/v1/forecast'
  post 'api/v1/users'
  post 'api/v1/sessions'
  (post 'api/v1/road_trip') => not done
```
### Forecast

#### Request
```
get http://localhost:3000/api/v1/forecast?location=denver,co
```
#### Response
```
"data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "last_updated": "2023-06-12 19:45",
                "temperature": 54.0,
                "feels_like": 54.8,
                "humidity": 80,
                "uvi": 4.0,
                "visibility": 9.0,
                "conditions": "Partly cloudy",
                "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png"
            },
            "daily_weather": [
                {
                    "date": "2023-06-13",
                    "sunrise": "05:32 AM",
                    "sunset": "08:29 PM",
                    "max_temp": 61.0,
                    "min_temp": 52.5,
                    "conditions": "Heavy rain",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/308.png"
                },
                {
                    "date": "2023-06-14",
                    "sunrise": "05:32 AM",
                    "sunset": "08:29 PM",
                    "max_temp": 83.1,
                    "min_temp": 48.9,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png"
                },
                etc... for the next 3 days
            ],
            "hourly_weather": [
                {
                    "time": "00:00",
                    "temperature": 54.1,
                    "conditions": "Moderate rain at times",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/299.png"
                },
                {
                    "time": "01:00",
                    "temperature": 53.8,
                    "conditions": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png"
                },
                this is repeated for the next remaining hours
            ]
        }
    }
}
```

### User registration

#### Request
```
post http://localhost:3000/api/v1/users
  # in the body of the request, send
  {
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
#### Response
```
{
    "data": {
        "id": "3",
        "type": "users",
        "attributes": {
            "email": "whatever@examples.com",
            "api_key": "61e82e95170d1a917904be3967"
        }
    }
}
```

### User Login

#### Request
```
post http://localhost/api/v1/sessions
 in the body of the request:
  {
  "email": "whatever@example.com",
  "password": "password"
}
```

#### Response (User has to already exist and passwords have to match)
```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
    }
  }
}
```

## API's Used
- Weather API (for weather info)
- MapQuest API (for directions)

## Running On
  - Rails 7.0.4
  - Ruby 3.1.1

## Built With
* ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
* ![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
* ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
* ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svgstyle=for-the-badgelogo=visual-studio-codelogoColor=white)

## Created by
- <a href="https://github.com/BLowrey24">Boston Lowrey</a><br>
<small><a href="https://www.linkedin.com/in/boston-lowrey/">GitHub</a></small>

