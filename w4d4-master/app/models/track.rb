class Track < ActiveRecord::Base
  validates :name, :album_id, presence: true
  validates :name, uniqueness: { scope: :album_id }
  belongs_to :album
  has_one :band, through: :album
  has_many :notes
  
  def inspect
    self.name
  end

  def to_s
    self.name
  end
end
