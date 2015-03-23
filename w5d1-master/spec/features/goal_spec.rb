require 'rails_helper'
require_relative 'features_helper.rb'

feature "creating goals" do

  before(:each) do
    user1 = FactoryGirl.build(:user)
    user1.save
    login_user(user1)
  end

  scenario "user can create a goal" do
    user = User.find_by(username: "user1")

    visit new_goal_url
    fill_in "title", with: "goal 1"
    fill_in "description", with: "description"
    click_on "Create Goal"

    expect(page).to have_content "goal 1"
    expect(Goal.last.user_id).to equal(user.id)
  end

  scenario "user can create a private goal" do
    visit new_goal_url
    fill_in "title", with: "goal 1"
    fill_in "description", with: "description"
    check('private')
    click_on "Create Goal"

    expect(Goal.last.private).to be true
  end

end

feature "changing goals" do

  before(:each) do
    user1 = FactoryGirl.build(:user)
    user1.save
    login_user(user1)
    create_goal("goal1")
  end

  scenario "user can navigate to edit page" do
    goal = Goal.find_by(title: "goal1")
    visit goal_url(goal)
    expect(page).to have_content "Edit Goal"
    click_on 'Edit Goal'
    expect(current_path).to eq edit_goal_path(goal)
  end


  scenario "user can edit a goal" do
    goal = Goal.find_by(title: "goal1")

    visit edit_goal_url(goal)
    fill_in "title", with: "new title"
    fill_in "description", with: "new description"
    click_on "Update Goal"

    expect(page).to have_content "new title"
    expect(page).to have_content "new description"
  end

  scenario "user can change goal's privacy setting" do
    goal = Goal.find_by(title: "goal1")
    expect(goal.private).to be false

    visit edit_goal_url(goal)
    check('private')
    click_on "Update Goal"

    goal.reload
    expect(goal.private).to be true

  end

  scenario "user can't edit another's goal" do
    click_on "Log Out"
    user2 = FactoryGirl.build(:user, username: "user2")
    user2.save
    login_user(user2)
    goal = Goal.find_by(title: "goal1")

    visit goal_url(goal)
    expect(page).not_to have_content "Edit Goal"

    visit edit_goal_url(goal)
    expect(current_path).not_to eq edit_goal_path(goal)
  end
end

feature "deleting goals" do

  before(:each) do
    user1 = FactoryGirl.build(:user)
    user1.save
    login_user(user1)
    create_goal("goal1")
  end

  scenario "user can delete a goal" do
    goal = Goal.find_by(title: "goal1")
    goal_id = goal.id

    visit edit_goal_url(goal)
    expect(page).to have_content("Delete Goal")

    click_on("Delete Goal")
    goal = Goal.find_by(id: goal_id)
    expect(goal).to be_nil

  end

end

feature "displaying goals" do

  before(:each) do
    user1 = FactoryGirl.build(:user)
    user2 = FactoryGirl.build(:user, username: "user2")
    user1.save!
    user2.save!
    login_user(user1)
    create_goal("goal1")
    create_private_goal("goal2")
  end

  scenario "user can see all of their own goals" do
    user = User.find_by(username: "user1")
    visit user_url(user)
    expect(page).to have_content("goal1" && "goal2")
  end

  scenario "user can only view others' public goals" do
    user2 = User.find_by(username: "user2")
    logout_user
    login_user(user2)
    click_on "user1"

    expect(page).to have_content("goal1")
    expect(page).not_to have_content("goal2")

  end

  scenario "user can view description of goal" do
    goal = Goal.find_by(title: "goal2")
    user = User.find_by(username: "user1")
    visit user_url(user)
    click_on "goal2"

    expect(page).to have_content("description")

  end

  scenario "user can't view description of another's private goal" do
    goal = Goal.find_by(title: "goal2")
    user2 = User.find_by(username: "user2")
    logout_user
    login_user(user2)

    visit goal_url(goal)
    expect(page).not_to have_content("description")


  end

end
