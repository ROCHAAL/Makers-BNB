feature 'booking_system' do 
  scenario 'there is a booking button' do
    sign_up_and_log_in
    Listing.create(address: 'alexs@numericable.fr', description: 'Great big house!', available_dates: "now", price_per_night: "1", user_id: 1)
    click_button 'Listings'
    expect(page).to have_button 'Book Place'
  end

  scenario 'listings page only shows available listings' do 
    sign_up_and_log_in
    Listing.create(address: 'alexs@numericable.fr', description: 'Great big house!', available_dates: "now", price_per_night: "1", user_id: 1)
    listing2 = Listing.create(address: 'alexs2@numericable.fr', description: 'Great big house2!', available_dates: "now", price_per_night: "1", user_id: 1)
    listing2.approve_booking_request
    click_button 'Listings'
    expect(page).to have_content 'alexs@numericable.fr'
    expect(page).to_not have_content 'alexs2@numericable.fr'
  end
end
