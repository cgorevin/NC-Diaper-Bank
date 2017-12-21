def login_admin
    admin = create(:admin, password: "foobar")
    visit "/"
    click_link("Login")
    fill_in("Email", with: admin.email)
    fill_in("Password", with: "foobar")
        
    click_button("Log in")    
end
    