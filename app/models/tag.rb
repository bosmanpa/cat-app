class Tag < ApplicationRecord
    has_many :cat_tags
    has_many :cats, through: :cat_tags

    def self.trending
        self.all.sort_by{|tag| tag.cat_tags.count}.reverse
    end
end
