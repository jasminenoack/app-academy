class TagTopic < ActiveRecord::Base
  validates :tag_name, presence: true, uniqueness: true

  has_many(
     :taggings,
     class_name: "Tagging",
     foreign_key: :tag_id,
     primary_key: :id
  )

  has_many :urls, :through => :taggings, :source => :url

end
