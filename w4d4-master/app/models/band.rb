class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums

  def inspect
    self.name
  end

  def to_s
    self.name
  end
end
