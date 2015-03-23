class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :long_url, presence: true,
    uniqueness: true, length: { maximum: 255 }
  validates :user_id, presence: true
  validate :under_max_submissions

  belongs_to(
    :submitter,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: "Visit",
    foreign_key: :short_url_id,
    primary_key: :id
  )

  has_many(
      :visitors,
      -> { distinct },
      through: :visits,
      source: :visitor
      )

  has_many(
     :taggings,
     class_name: "Tagging",
     foreign_key: :short_url_id,
     primary_key: :id

  )

  has_many :tags, :through => :taggings, :source => :tag_topic

  def self.create_for_user_and_long_url!(user, long_url)
    short_url = self.random_code
    self.create!({short_url: short_url, user_id: user.id, long_url: long_url})
  end


  def self.random_code
    code = SecureRandom::urlsafe_base64
    if self.exists?(:short_url => code)
      self.random_code
    else
      code
    end
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visits.select(:user_id).distinct.where(created_at: 10.minutes.ago..Time.now).count
  end

  private

  def under_max_submissions
    submissions = self.class.where(created_at: 1.minute.ago..Time.now, :user_id => user_id).count
    if submissions > 4
      errors[:base] << "Too many submissions"
    end
  end

end
