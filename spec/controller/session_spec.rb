require 'rails_helper'

describe "the login process" do
  before :each do
    User.create(username: 'elephant', password: 'tusk')
  end

  it "logs me in" do
    visit '/login'
    within('#new_user') do
      fill_in 'Username', :with => 'elephant'
      fill_in 'Password', :with => 'tusk'
    end
    click_button 'Login'
    expect(page).to have_content 'elephant'
    expect(page).to have_link 'Profile'
    expect(page).to have_link 'Logout'
  end
end
