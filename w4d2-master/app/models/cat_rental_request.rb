class CatRentalRequest < ActiveRecord::Base

  validates :start_date, :end_date, :cat_id, presence: true
  validates :status, inclusion:{in:["PENDING", "APPROVED", "DENIED"]}
  validate :overlapping_approved_requests
  validates :user_id, presence: true
  belongs_to(
  :cat,
  :class_name => "Cat",
  :primary_key => :id,
  :foreign_key => :cat_id
  )


belongs_to(
:requester,
:class_name => "User",
:primary_key => :id,
:foreign_key => :user_id
)
  def approve!

    CatRentalRequest.transaction do
      self.status = "APPROVED"
      self.save!
      overlapping_pending_requests.each do |request|
        request.deny!
      end
    end

  end

  def pending?
    status == "PENDING"
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end


  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def overlapping_requests
    requests = CatRentalRequest.where("cat_id = ?", cat.id)
    if persisted?
      requests = requests.where("id != ? ", id)
    end
      requests.where("NOT (start_date > ?
                      OR end_date < ?)",
                      end_date, start_date)
  end

  def overlapping_approved_requests
    unless status == "DENIED"
      requests = overlapping_requests.where(status: "APPROVED")
      unless requests.empty?
        errors[:base] << "Cannot overlap an approved request!"
      end
    end
  end
end
