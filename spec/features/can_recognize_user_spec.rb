feature "can recognize user" do
  scenario "recognizes user that made the listing" do
    User.create(username: 'test', password: 'testpassword', email: 'test@test.com')
    visit("/")
    click_button("Login")
    fill_in("username", with: "test")
    fill_in("password", with: "testpassword")
    click_button("Login")
    click_button("Add Listing")
    fill_in("address", with: "123 somewhere")
    fill_in("description", with: "old house")
    click_button("Submit")
    expect(page).to have_content("old house")
    expect(page).to have_content("123 somewhere")
    expect(page).to have_content("test")
    expect(page).to have_content("test@test.com")
  end
end
