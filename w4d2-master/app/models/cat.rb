class Cat < ActiveRecord::Base
  validates :color, :name, :sex, presence: true
  validates :sex, inclusion: { in: ["M", "F"] }
  validates :color, inclusion: { in: ["black", "white", "orange", "brown"] }
  validates :user_id, presence: true

  belongs_to(
  :owner,
  :class_name => "User",
  :foreign_key => :user_id,
  :primary_key => :id
  )

  has_many(
  :rental_requests,
  :class_name => "CatRentalRequest",
  :primary_key => :id,
  :foreign_key => :cat_id,
  dependent: :destroy
  )

  def age
    if birth_date
      Time.new.year - birth_date.year
    end
  end

end
