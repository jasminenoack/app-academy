class Post < ActiveRecord::Base
  validates :title, :body, length: {minimum: 5}

end
