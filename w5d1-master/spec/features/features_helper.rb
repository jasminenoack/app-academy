def login_user(user, password = "password")
  visit new_session_url
  fill_in 'username', with: user.username
  fill_in 'password', with: password
  click_on "Sign In"
end

def create_goal(title)
  visit new_goal_url
  fill_in "title", with: title
  fill_in "description", with: "description"
  click_on "Create Goal"
end

def create_private_goal(title)
  visit new_goal_url
  fill_in "title", with: title
  fill_in "description", with: "description"
  check("private")
  click_on "Create Goal"
end

def logout_user
  click_on "Log Out"
end
