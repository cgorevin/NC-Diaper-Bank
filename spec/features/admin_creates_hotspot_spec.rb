require "rails_helper"

feature "admin creatures hotspot" do
    scenario "with valid fields" do
        visit new_hotspot_path
        fill_in("Title", with:"walmart")
        fill_in("street address", with:"1021 Fayetteville St")
        fill_in("city", with:"Durham")
        fill_in("state", with:"NC")
        fill_in("zip code", with:"27707")
        fill_in("phone number", with:"(919)123-4567")
        
        click_button("Save")
        
        expect(page).to have_content "Hotspot created succesfully."
    end
    
        scenario "with invalid fields" do
        visit new_hotspot_path
        
        click_button("Save")
        
        expect(page).to have_content "Hotspot could not be saved."
    end
end