class Tag < ApplicationRecord
    has_many :cat_tags
    has_many :cats, through: :cat_tags
end
