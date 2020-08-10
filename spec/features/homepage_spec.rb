feature "The homepage" do
  scenario "has a button that direct the user to a listings page" do
    visit('/')
    click_button("Listings")
    expect(page).to have_content("house 1")
  end
end