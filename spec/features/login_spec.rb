feature 'user login/sign up' do
  scenario 'users can login/sign up' do
     visit('/')
     expect(page).to have_selector(:link_or_button, 'Login')
     expect(page).to have_selector(:link_or_button, 'Sign Up')
  end

  scenario 'user is redirected to login page' do
    visit('/')
    click_button('Login')
    expect(page).to have_content('Username')
  end

  scenario 'a user logs in with an existing account' do 
    User.create(username: 'test_username', password: 'test_password', email: 'test@test.com')
    visit '/'
    click_button 'Login'
    fill_in('username', with: 'test_username')
    fill_in('password', with: 'test_password')
    click_button 'Login'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Hello test_username!'
  end

  scenario 'a user puts in an incorrect username' do
    User.create(username: 'test_username', password: 'test_password', email: 'test@test.com')
    visit '/'
    click_button 'Login'
    fill_in('username', with: 'incorrect_username')
    fill_in('password', with: 'test_password')
    click_button 'Login'
    expect(page).to have_content 'Incorrect username or password, try again.'
    expect(current_path).to eq '/sessions/new'
  end

  scenario 'a user puts in an incorrect password' do
    User.create(username: 'test_username', password: 'test_password', email: 'test@test.com')
    visit '/'
    click_button 'Login'
    fill_in('username', with: 'test_username')
    fill_in('password', with: 'incorrect_password')
    click_button 'Login'
    expect(page).to have_content 'Incorrect username or password, try again.'
    expect(current_path).to eq '/sessions/new'
  end
end
