feature 'sign_up' do
  scenario 'there is a sign_up button' do
    visit('/')
    expect(page).to have_button 'Sign Up'
  end
  scenario ' the user can sign_up into the website'do
  visit('/')
  click_button 'Sign Up'
  fill_in('username', with: 'test')
  fill_in('password', with: 'test')
  fill_in('email', with: 'test')
  click_button 'Sign Up'
  expect(page).to have_content 'Hello test!'
  end
end
