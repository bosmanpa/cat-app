class CatTag < ApplicationRecord
    belongs_to :cat
    belongs_to :tag
end
