class Album < ActiveRecord::Base
  validates :band_id, :name, :year, presence: true
  validates :name, uniqueness: { scope: :band_id }
  has_many :tracks, dependent: :destroy
  belongs_to :band

  def inspect
    self.name
  end

  def to_s
    self.name
  end
end
