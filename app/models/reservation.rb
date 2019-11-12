class Reservation < ApplicationRecord
    belongs_to :renter, class_name: 'User'
    belongs_to :cat
    has_one :cat_review, dependent: :destroy
    has_one :renter_review, dependent: :destroy

end
