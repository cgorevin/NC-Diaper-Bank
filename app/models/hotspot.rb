class Hotspot < ActiveRecord::Base
    validates_presence_of :street_address, :city, :zip_code, :title
end
