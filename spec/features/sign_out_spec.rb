feature 'sign_out' do
  scenario 'there is a button to sign_out'do
    sign_up_and_log_in
    expect(page).to have_button 'Sign Out'
  end
end
