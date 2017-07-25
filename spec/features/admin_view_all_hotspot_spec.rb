 require "rails_helper"
 
 feature "admin views all hotspots" do 
     scenario "when hotspots exis" do
         hotspot = create(:hotspot)
         
         visit hotspots_path
         expect(page).to have_content hotspot.title
         expect(page).to have_content hotspot.street_address
         expect(page).to have_content hotspot.city
         expect(page).to have_content hotspot.state
         expect(page).to have_content hotspot.zip_code
         expect(page).to have_content hotspot.phone_number
     end
     
     scenario "when there are no hotsopts" do
         visit hotspots_path
         
         expect(page).to have_content "There are no hotspots"
     end
 end 