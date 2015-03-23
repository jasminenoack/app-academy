class Group < ActiveRecord::Base
  belongs_to :user
  has_many :groupings
  has_many :contacts, through: :groupings, source: :contact

end
