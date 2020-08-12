feature 'user login/sign up' do
  scenario 'users can login/sign up' do
     visit('/')
     expect(page).to have_selector(:link_or_button, 'login')
     expect(page).to have_selector(:link_or_button, 'sign up')
  end

  scenario 'user is redirected to login page' do
    visit('/')
    click_button('login')
    expect(page).to have_content('Username')
  end

end
