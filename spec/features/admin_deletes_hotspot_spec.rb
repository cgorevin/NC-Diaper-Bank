require "rails_helper"

feature 'Admin deletes hotspot' do
  scenario do
    hotspot = create(:hotspot)
    visit edit_hotspot_path(hotspot)
    
    click_link 'Delete'
    expect(page).to have_content 'The hotspot was deleted succesfully'
    expect(page).to_not have_content hotspot.title
  end
end