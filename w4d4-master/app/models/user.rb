class User < ActiveRecord::Base
  validates :session_token, :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  validate :valid_email, :confirm_password_match

  after_initialize :ensure_token
  has_many :notes
  
  attr_accessor :password, :confirm_password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    return nil if user.nil? || !user.is_password?(password)
    user
  end

  def ensure_token
    self.session_token = create_token
  end

  def create_token
    token = SecureRandom::urlsafe_base64
    User.find_by(session_token: token) ? create_token : token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password
    @password
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def confirm_password=(confirm_password)
    @confirm_password = confirm_password
  end

  def confirm_password
    @confirm_password
  end

  def session_token
    @session_token ||= super
  end

  def reset_session_token!
    self.create_token
    self.save
  end

  private
  def valid_email
    unless self.email =~ /.+@.+\..+/
      errors[:email] << "That email is not valid"
    end
  end

  def confirm_password_match
    return nil unless password
    unless password == confirm_password
      errors[:password] << "does not match confirmation"
    end
  end
end
