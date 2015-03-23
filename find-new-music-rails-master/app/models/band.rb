class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
  belongs_to :user

  def inspect
    self.name
  end

  def owner_id
    user.id
  end

  def to_s
    self.name
  end
end
