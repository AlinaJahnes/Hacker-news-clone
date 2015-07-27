require 'rails_helper'

describe "the signup process" do

  it "signs me up" do
    visit '/signup'
    within('#new_user') do
      fill_in 'Username', :with => 'rabbit'
      fill_in 'Password', :with => 'carrot'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Hacker News'
    expect(page).to have_link 'Logout'
    expect(page).to have_link 'Profile'
  end
end

