feature 'my listings booking approval' do
  scenario 'listings to approve appear on the homepage' do
    sign_up_and_log_in
    Listing.create(address: 'alexs@numericable.fr', description: 'Great big house!', available_dates: "now", price_per_night: "1", user_id: 1)
    visit '/listings'
    click_button 'Book Place'
    visit '/'
    expect(page).to have_button 'Approve Booking'
  end

  scenario 'listings to approve appear do not appear on the homepage if signed out' do
    sign_up_and_log_in
    Listing.create(address: 'alexs@numericable.fr', description: 'Great big house!', available_dates: "now", price_per_night: "1", user_id: 1)
    visit '/listings'
    click_button 'Book Place'
    visit '/'
    click_button 'Sign Out'
    expect(page).to_not have_button 'Approve Booking'
  end
end
