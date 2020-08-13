feature 'sign_up' do
  scenario 'there is a sign_up button' do
    visit('/')
    expect(page).to have_button 'Sign Up'
  end

  scenario 'the user can sign_up into the website' do
    visit('/')
    click_button 'Sign Up'
    fill_in('username', with: 'test')
    fill_in('password', with: 'test')
    fill_in('email', with: 'test')
    click_button 'Sign Up'
    expect(page).to have_content 'Hello test!'
  end

  scenario 'registering an account with the same email causes an error' do 
    User.create(username: 'testuser', password: 'test123', email: 'test@testface.com')
    visit '/user/new'
    fill_in('username', with: 'duplicate')
    fill_in('password', with: 'test')
    fill_in('email', with: 'test@testface.com')
    click_button 'Sign Up'
    expect(page).to have_content 'An account already exists with this email or username.'
  end

  scenario 'registering an account with an existing username causes an error' do 
    User.create(username: 'testuser', password: 'test123', email: 'test@testface.com')
    visit '/user/new'
    fill_in('username', with: 'testuser')
    fill_in('password', with: 'test123')
    fill_in('email', with: 'different_email')
    click_button 'Sign Up'
    expect(page).to have_content 'An account already exists with this email or username.'
    expect(current_path).to eq '/user/new'
  end
end
