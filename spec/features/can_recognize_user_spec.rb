feature "can recognize user" do
  scenario "recognizes user that made the listing" do
    sign_up_and_log_in
    click_button("Add Listing")
    fill_in("address", with: "123 somewhere")
    fill_in("description", with: "old house")
    click_button("Submit")
    expect(page).to have_content("old house")
    expect(page).to have_content("123 somewhere")
    expect(page).to have_content("test")
    expect(page).to have_content("test@testface.com")
  end
end
