 require "rails_helper"

feature "admin edits hotspot" do
    
   scenario "with valid fields" do
       hotspot = create(:hotspot)
       
       visit edit_hotspot_path(hotspot)
       fill_in("Title", with:"walmart")
       fill_in("street address", with:"1021 Fayetteville St")
       fill_in("city", with:"Durham")
       fill_in("state", with:"NC")
       fill_in("zip code", with:"27707")
       fill_in("phone number", with:"(919)123-4567")
       
       click_button("Save")
       
       expect(page).to have_content "Hotspot updated succesfully."
   end
   
    scenario "with invalid fields" do
        hotspot = create(:hotspot)
        visit edit_hotspot_path(hotspot)
        fill_in("Title", with:"")
        
        click_button("Save")
       
        expect(page).to have_content "There was an error updating the hotspot."
   end
end