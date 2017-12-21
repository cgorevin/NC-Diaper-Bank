class Hotspot < ActiveRecord::Base
    validates_presence_of :street_address, :city, :zip_code, :title, :country
    after_validation :geocode, if: ->(obj){ obj.full_street_address.present? and obj.address_changed? }
    geocoded_by :full_street_address do |obj,results|
        if geo = results.first
            obj.street_address = parse_address(geo.address)[0]
            obj.city = parse_address(geo.address)[1]
            obj.state = geo.state
            obj.country = geo.country
            obj.zip_code = parse_zip_code(geo.address)[-2].chomp(',')
            obj.latitude = geo.latitude
            obj.longitude = geo.longitude
            obj
        end
    end   
    acts_as_mappable :lat_column_name => :latitude,
                     :lng_column_name => :longitude
    
    def self.parse_address(geo_address)
        geo_address.split(",")
    end
    
    def self.parse_zip_code(geo_address)
        geo_address.split(' ')
    end
    
    def full_street_address
        [street_address, city, state, zip_code, country].compact.join(', ')
    end
    
    def address_changed?
       street_address_changed? || city_changed? || zip_code_changed?
    end
end
