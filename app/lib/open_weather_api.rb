module OpenWeatherAPI
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5/'

  class << self
    def forecast(city)
      response = get('/forecast', query: authentication.merge(q: city, units: 'metric'))
      return JSON.parse(response.body) if response.success?
      raise ResponseError, response.message
    end

    def authentication
      { APPID: ENV['OPEN_WEATHER_APPID'] }
    end
  end

  class ResponseError < StandardError; end
end
