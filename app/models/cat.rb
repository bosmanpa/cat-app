class Cat < ApplicationRecord
    belongs_to :owner, class_name: 'User'
    has_many :reservations
    has_many :cat_tags
    has_many :tags, through: :cat_tags
end
