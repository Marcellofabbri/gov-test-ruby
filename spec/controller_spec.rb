require 'controller.rb'

LONDON_LONGITUDE_KM = (51.5074 * 111)
LONDON_LATITUDE_KM = (-0.1278 * 111)

describe Controller do

  describe '#return_people' do
    it "returns a list of people living within a radius" do
      # expect(subject.return_people(50)).to be Array
    end
  end

  describe '#request_all_users' do
    it "sends a GET request to retrieve all users and returns a response" do
      expect(subject.request_all_users.code).to eq 200
    end
  end

  describe '#array_of_users' do
    it "turns the response object to array" do
      expect(subject.array_of_users).to be_kind_of(Array)
    end
  end

  describe '#filter_users_by_distance' do
    it "parses the response and returns a hash filtered by acceptable coordinates" do

      filtered_array_of_users = subject.filter_users_by_distance(50)

      for user in filtered_array_of_users
        longitude_km = (user["longitude"]*111)
        latitude_km = (user["latitude"]*111)
        x_distance = longitude_km.to_i - LONDON_LONGITUDE_KM
        y_distance = latitude_km.to_i - LONDON_LATITUDE_KM
        radius = Math.sqrt((x_distance ** 2 + y_distance ** 2))
        expect(radius <= 50).to be true
      end
      
    end
  end
  
end