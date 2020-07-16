require 'httparty'

class Finder

  LATITUDE_TO_MILES = 69.1
  LONGITUDE_TO_MILES = 44.5
  LONDON_LATITUDE_MI = (51.5074 * LATITUDE_TO_MILES)
  LONDON_LONGITUDE_MI = (-0.1278 * LONGITUDE_TO_MILES)

  def filter_users_by_distance(miles)
    filtered_array = []

    array_of_users.each { |user|
        longitude_mi = (user["longitude"].to_f * LONGITUDE_TO_MILES)
        latitude_mi = (user["latitude"].to_f * LATITUDE_TO_MILES)
        x_distance = longitude_mi.to_f - LONDON_LONGITUDE_MI
        y_distance = latitude_mi.to_f - LONDON_LATITUDE_MI
        radius = Math.sqrt((x_distance ** 2) + (y_distance ** 2))
        if (radius < miles + 1) && (user["longitude"] != nil) && (user["latitude"] != nil)
          filtered_array.push(user)
        end
      }

    return filtered_array
  end

  def request_all_users
    response = HTTParty.get('http://bpdts-test-app.herokuapp.com/users')
    return response
  end

  def array_of_users
    request_all_users.parsed_response
  end

end
