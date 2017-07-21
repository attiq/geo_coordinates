class Location < ActiveRecord::Base
  validates :address, :latitude, :longitude, presence: true
  validates :address, uniqueness: true

  class << self

    def geo_coordinates(address)
      #chek if address is already exists in database
      location = Location.where(address: address).first
      return location if location.present?
      #It will determine randomly to generate random coordinates
      generate_random_location if [true, false].sample
    end

    # It will generate, store, and return, randomly generated coordinates
    def generate_random_location
      location = Geocoder.search('41.38506, 2.17340').sample
      return nil unless location.address.present?
      create(address: location.address, latitude: location.latitude, longitude: location.longitude)
    end

  end
end
