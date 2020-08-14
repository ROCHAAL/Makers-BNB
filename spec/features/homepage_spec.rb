feature "The homepage" do
  scenario "has a button that direct the user to a listings page" do
    sign_up_and_log_in
    click_button("Listings")
    expect(page).to have_content("Current Listings")
  end

  scenario "has a button that directs the user to a create listings page" do
    sign_up_and_log_in
    click_button("Add Listing")
    expect(page).to have_content("New Listing:")
  end
end
