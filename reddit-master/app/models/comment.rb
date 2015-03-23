class Comment < ActiveRecord::Base
  validates :author, :post, presence: true
  validates :content, length: {minimum: 10, maximum: 1024}

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id,
    inverse_of: :comments
  )

  belongs_to :post, inverse_of: :comments

  has_many(
    :child_comments,
    class_name: "Comment",
    foreign_key: :parent_id,
    primary_key: :id
  )

  belongs_to(
    :parent_comment,
    class_name: "Comment",
    foreign_key: :parent_id,
    primary_key: :id
  )

  def self.comments_by_parent_id
    comments = Hash.new { |h, k| h[k] = [] }
    Comment.all.each do |comment|
      comments[comment.parent_id] << comment
    end
    comments
  end

  def post_title
    post.title
  end

  def author_name
    author.username
  end

  def parent
    @parent ||= parent_comment
  end

  def children
    @children ||= child_comments
  end

  def parent_content
    parent.content
  end


end
