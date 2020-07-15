require 'httparty'

class Controller

  LONDON_LONGITUDE_KM = (51.5074 * 111)
  LONDON_LATITUDE_KM = (-0.1278 * 111)
  
  def return_people(kilometers)
  end

  def request_all_users
    response = HTTParty.get('http://bpdts-test-app.herokuapp.com/users')
    return response
  end

  def array_of_users
    request_all_users.parsed_response
  end

  def filter_users_by_distance(kilometers)
    filtered_array = []

    for user in array_of_users
        longitude_km = (user["longitude"]*111)
        latitude_km = (user["latitude"]*111)
        x_distance = longitude_km.to_i - LONDON_LONGITUDE_KM
        y_distance = latitude_km.to_i - LONDON_LATITUDE_KM
        radius = Math.sqrt((x_distance ** 2 + y_distance ** 2))

        if radius <= 50
          filtered_array.push(user)
        end
    end

    return filtered_array
  end

end