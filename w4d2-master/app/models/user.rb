class User < ActiveRecord::Base
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :user_name, presence: true, uniqueness: true

has_many(
:cats,
:class_name => "Cat",
:foreign_key => :user_id,
:primary_key => :id
)

has_many(
:requests,
:class_name => "CatRentalRequest",
:foreign_key => :user_id,
:primary_key => :id
)

has_many(
  :sessions,
  :class_name => "Session",
  primary_key: :id,
  foreign_key: :user_id
)

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password
    @password
  end

  def is_password?(password)
    check = BCrypt::Password.new(password_digest)
    check.is_password?(password)
  end



  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

end
