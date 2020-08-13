require 'spec_helper'


feature "AirBnb" do
  scenario "should have a working testing infrastructure" do
    visit('/')
    expect(page).to have_content("Testing infrastructure: ONLINE")
  end
end
