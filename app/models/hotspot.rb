class Hotspot < ActiveRecord::Base
    validates_presence_of :street_address, :city, :zip_code, :title, :country
    after_validation :geocode, if: ->(obj){ obj.full_street_address.present? && obj.address_changed? }
    paginates_per 10
    geocoded_by :full_street_address do |obj,results|
        if geo = results.first
            obj.city = geo.city
            obj.zip_code = geo.postal_code
            obj.latitude = geo.latitude
            obj.longitude = geo.longitude
            obj
        end
    end

    def get_distance(hotspot)
      distance = Geocoder::Calculations.distance_between(
        [self.latitude, self.longitude], [hotspot.latitude, hotspot.longitude]
      )

      distance.round(1)
    end

    def full_street_address
        [street_address, city, state, zip_code, country].compact.join(', ')
    end

    def address_changed?
       street_address_changed? || city_changed? || zip_code_changed?
    end

    def self.address_sort(current_location)
       Hotspot.all.sort_by do |hotspot|
         hotspot.get_distance(current_location)
       end[0..2]
    end

end
