require 'rails_helper'
require_relative 'features_helper.rb'

feature "user must log in to comment" do

  before(:each) do
    user1 = FactoryGirl.build(:user)
    user1.save!
    login_user(user1)
    create_goal("goal1")
    create_goal("goal2")
    logout_user
  end

  scenario "logged out user cannot comment on a user" do
    user = User.find_by(username: "user1")
    visit user_url(user)
    expect(page).not_to have_content "Submit Comment"
  end

  scenario "logged out user cannot comment on a goal" do
    goal = Goal.find_by(title: "goal1")
    visit goal_url(goal)
    expect(page).not_to have_content "Submit Comment"
  end

end


feature "comments on goals" do

  before(:each) do
    user1 = FactoryGirl.build(:user)
    user1.save!
    login_user(user1)
    create_goal("goal1")
  end

  scenario "user can view comment form on goals" do
    goal = Goal.find_by(title: "goal1")
    visit goal_url(goal)

    expect(page).to have_content "Submit Comment"
  end

  scenario "user can comment on goals" do
    goal = Goal.find_by(title: "goal1")
    visit goal_url(goal)

    fill_in "content", with: "comment1"
    click_on "Submit Comment"
    expect(page).to have_content "comment1"
  end

  scenario "user cannot submit blank comment" do
    goal = Goal.find_by(title: "goal1")
    visit goal_url(goal)

    click_on "Submit Comment"
    expect(page).to have_content "Comment cannot be blank"
  end

end

feature "comments on users" do

  before(:each) do
    user1 = FactoryGirl.build(:user)
    user1.save!
    login_user(user1)
    create_goal("goal1")
  end

  scenario "user can comment on users" do
    user = User.find_by(username: "user1")
    visit user_url(user)

    fill_in "content", with: "comment1"
    click_on "Submit Comment"
    expect(page).to have_content "comment1"
  end

end
