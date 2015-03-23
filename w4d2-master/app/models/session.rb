class Session < ActiveRecord::Base
  validates :user_id, :session_token, presence: true

  after_initialize :ensure_session_token

  belongs_to(
    :user,
    :class_name => "User",
    primary_key: :id,
    foreign_key: :user_id
  )

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save
  end

  def record_env(env, ip)
    self.environment = env
    self.ip_address = ip
    self.save
  end

end
