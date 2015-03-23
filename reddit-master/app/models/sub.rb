class Sub < ActiveRecord::Base
  validates :title, :moderator, presence: true
  validates :title, uniqueness: true

  belongs_to(
    :moderator,
    class_name: "User",
    foreign_key: :moderator_id,
    primary_key: :id,
    inverse_of: :subs
  )

  has_many :postings, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :postings, source: :post, inverse_of: :subs


  def moderator_name
    moderator.username
  end

  def moderator_id
    moderator.id
  end
end
