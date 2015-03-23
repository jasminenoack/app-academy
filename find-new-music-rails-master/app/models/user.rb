class User < ActiveRecord::Base
  validates(
    :username,
    :session_token,
    presence: true,
    uniqueness: true
  )
  validates :password, length: { minimum: 6 }, allow_nil: true
  validate(
    :password_includes_number,
    :valid_email,
    :confirm_match
  )

  has_many(
    :favorite_bands,
    class_name: "Band",
    primary_key: :id,
    foreign_key: :user_id
  )

  after_initialize :ensure_token

  def confirm_password=(confirmation)
    @confirm_password=confirmation
  end

  def ensure_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def password
    @password
  end

  def password=(password)
    @password = password.strip
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username.strip)
    user && user.is_password?(password.strip) ? user : nil
  end

  private
  def confirm_match
    unless password == @confirm_password
      errors[:password] << " does not match confirmation"
    end
  end

  def password_includes_number
    return if password.nil?

    unless password.match(/\d/)
      errors[:password] << " must include number"
    end
  end

  def valid_email
    unless email.match(/.+@.+\..+/)
      errors[:email] << " is not valid"
    end
  end

end
