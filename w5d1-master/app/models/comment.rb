class Comment < ActiveRecord::Base
  validates :content, :commentable_id, :commentable_type, :author_id, presence: true

  belongs_to :commentable, polymorphic: true

end
