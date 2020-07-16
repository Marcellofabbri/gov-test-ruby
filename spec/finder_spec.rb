require 'finder.rb'

LONDON_LATITUDE_MI = (51.5074 * 69.1)
LONDON_LONGITUDE_MI = (-0.1278 * 44.5)

describe Finder do

  describe '#request_all_users' do
    it "sends a GET request to retrieve all users and returns a response" do
      expect(subject.request_all_users.code).to eq 200
    end
  end

  describe '#array_of_users' do
    it "turns the response object to array" do
      expect(subject.array_of_users).to be_kind_of(Array)
      expect(subject.array_of_users[0]["first_name"]).not_to be_empty
    end
  end

  describe '#filter_users_by_distance' do
    it "parses the response and returns a hash filtered by acceptable coordinates" do

      filtered_array_of_users = subject.filter_users_by_distance(50)

      expect(filtered_array_of_users).not_to be_empty

      filtered_array_of_users.each do |user|
        longitude_mi = (user["longitude"].to_f * 44.5)
        latitude_mi = (user["latitude"].to_f * 69.1)
        x_distance = longitude_mi.to_f - LONDON_LONGITUDE_MI
        y_distance = latitude_mi.to_f - LONDON_LATITUDE_MI
        radius = Math.sqrt((x_distance ** 2) + (y_distance ** 2))
        expect(radius < 51.0).to be true
      end

    end
  end
  
end