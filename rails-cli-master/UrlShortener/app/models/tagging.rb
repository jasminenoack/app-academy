class Tagging < ActiveRecord::Base
  validates :short_url_id, :tag_id, presence: true

  belongs_to(
     :url,
     class_name: "ShortenedUrl",
     foreign_key: :short_url_id,
     primary_key: :id
  )

  belongs_to(
     :tag_topic,
     class_name: "TagTopic",
     foreign_key: :tag_id,
     primary_key: :id
  )


end
