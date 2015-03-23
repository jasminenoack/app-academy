# spec/features/auth_spec.rb

require 'spec_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      visit new_user_url
      fill_in 'username', with: "user1"
      fill_in 'password', with: "password"
      click_on "Create User"

      expect(page).to have_content "user1"

    end

  end

end

feature "logging in" do

  before(:each) do
    user = FactoryGirl.build(:user).save
  end

  scenario "shows username on the homepage after login" do
    visit new_session_url
    expect(page).to have_content "Log In"
    fill_in 'username', with: 'user1'
    fill_in 'password', with: 'password'
    click_on "Sign In"
    expect(page).to have_content "user1"
  end

end

feature "logging out" do

  scenario "begins with logged out state" do
    visit users_url
    expect(page).to have_content "User Sign In"
    click_on "User Sign In"
    expect(page).to have_content "Log In"
  end

  scenario "doesn't show username on the homepage after logout" do
    visit new_user_url
    fill_in 'username', with: "user1"
    fill_in 'password', with: "password"
    click_on "Create User"

    click_on "Log Out"
    expect(page).to have_content "Sign In"

  end

end
