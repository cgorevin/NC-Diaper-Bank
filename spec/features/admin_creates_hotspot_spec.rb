require "rails_helper"

feature "admin creatures hotspot" do
    before :each do
        login_admin
    end
    
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
    
    def login_admin
        admin = create(:admin, password: "foobar")
        visit "/"
        click_link("Login")
        fill_in("Email", with: admin.email)
        fill_in("Password", with: "foobar")
        
        click_button("Log in")
    end
end