feature "The listings page" do
  scenario "has a list of houses" do
    Listing.create(address: "house 1", description: "lovely house")
    
    visit('/')
    click_button("Listings")
    expect(page).to have_content("house 1, lovely house")
  end
end