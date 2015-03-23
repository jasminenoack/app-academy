class Goal < ActiveRecord::Base

  validates :title, presence: true
  validates :private, inclusion: [true, false]

  belongs_to :user

  has_many :comments, as: :commentable


end
