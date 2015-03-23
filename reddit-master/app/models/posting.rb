class Posting < ActiveRecord::Base
  validates :post, :sub, presence: true
  validates :post, uniqueness: { scope: :sub }

  belongs_to :post, inverse_of: :postings
  belongs_to :sub, inverse_of: :postings

end
