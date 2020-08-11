feature "Listings" do
  scenario "can be added by a user" do
    visit('/')
    click_button("Add Listing")
    page.fill_in 'listing', with: 'house 4'
    click_button("Submit")
    expect(page).to have_content("house 4")
  end
end