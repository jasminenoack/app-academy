class User < ActiveRecord::Base
  validates :username, presence: true, length: { maximum: 255 }, uniqueness: true

  has_many(
    :contacts,
    class_name: "Contact",
    foreign_key: :user_id,
    primary_key: :id
  )
  has_many :groups
  
  has_many :comments, :as => :commentable

  has_many :contact_shares

  has_many :shared_contacts, through: :contact_shares, source: :contact

end
