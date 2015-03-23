module ApplicationHelper

  def following?(user)
    user.followers.include?(current_user)
  end

end
