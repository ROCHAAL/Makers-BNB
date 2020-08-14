def sign_up_and_log_in
  User.create(username: 'testuser', password: 'test123', email: 'test@testface.com')
  visit '/'
  click_button 'Login'
  fill_in('username', with: 'testuser')
  fill_in('password', with: 'test123')
  click_button 'Login'
end