class Reservation < ApplicationRecord
    belongs_to :renter, class_name: 'User'
    belongs_to :cat
    has_one :cat_review
    has_one :renter_review
    validates :date, date: { after: Proc.new { Date.today } }
    validates :date, uniqueness: { scope: :cat_id, message: "is already reserved for that cat." }
    validates :date, presence: true
end
