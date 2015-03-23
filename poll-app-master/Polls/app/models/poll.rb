class Poll < ActiveRecord::Base
  validates :author_id, :title, presence: true
  validates :title, length: { maximum: 255 }, uniqueness: true

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :questions,
    class_name: 'Question',
    foreign_key: :poll_id,
    primary_key: :id
  )

  

end
