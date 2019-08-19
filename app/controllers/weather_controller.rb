class WeatherController < ApplicationController
  def index
    forecast = {}
    OpenWeatherAPI.forecast(params['city'])['list'].each do |element|
      time = Time.at(element['dt'])
      forecast[time.to_date] ||= []

      forecast[time.to_date] << {
        datetime: time,
        temperature: element['main']['temp'],
        description: element['weather'].first['description']
      }
    end
    render json: forecast
  end
end
