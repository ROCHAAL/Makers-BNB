feature 'sign_out' do
  scenario 'there is a button to sign_out'do
    User.create(username: 'test_username', password: 'test_password', email: 'test@test.com')
    visit '/'
    click_button 'Login'
    fill_in('username', with: 'test_username')
    fill_in('password', with: 'test_password')
    click_button 'Login'
    expect(page).to have_button 'Sign Out'
  end
end
