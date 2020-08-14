def sign_up_and_log_in
  User.create(username: 'testuser', password: 'test123', email: 'test@testface.com')
  visit '/'
  click_button 'Login'
  fill_in('username', with: 'testuser')
  fill_in('password', with: 'test123')
  click_button 'Login'
end

def create_user_and_listing
  User.create(username: "test", password: "testpassword", email: "test@test.com")
  listing = Listing.create(address: 'alexs@numericable.fr', description: 'Great big house!', available_dates: "now", price_per_night: "1", user_id: 1)
end