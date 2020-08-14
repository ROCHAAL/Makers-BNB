feature "The listings page" do
  scenario "has a list of houses" do
    sign_up_and_log_in
    Listing.create(address: "house 1", description: "lovely house", user_id: 1)
    click_button("Listings")
    expect(page).to have_content("house 1, lovely house")
  end
end
