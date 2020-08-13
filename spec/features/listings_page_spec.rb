feature "The listings page" do
  scenario "has a list of houses" do
    User.create(username: "test", password: "testpassword", email: "test@test.com")
    Listing.create(address: "house 1", description: "lovely house", user_id: 1)
    visit('/')
    click_button("Listings")
    expect(page).to have_content("house 1, lovely house")
  end
end
