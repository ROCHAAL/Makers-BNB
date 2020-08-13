feature 'listings' do
  scenario "can be added by a user" do
    visit('/')
    click_button('Add Listing')
    page.fill_in 'address', with: 'house 4'
    page.fill_in 'description', with: 'old house'
    click_button('Submit')
    expect(page).to have_content('house 4, old house')
  end
end
