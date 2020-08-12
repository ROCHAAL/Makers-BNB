feature "The listings page" do
  scenario "has a list of houses" do
    visit('/')
    click_button("Listings")
    #expect(page).to have_content("house 1")
    #expect(page).to have_content("house 2")
    #expect(page).to have_content("house 3")
  end
end