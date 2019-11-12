class Cat < ApplicationRecord
    belongs_to :owner, class_name: 'User'
    has_many :reservations, dependent: :destroy
    has_many :cat_tags, dependent: :destroy
    has_many :tags, through: :cat_tags
    validates :name, presence: true

    def tags_attributes=(tag_attributes)
        tag_attributes.values.each do |tag_attribute|
            tag = Tag.find_or_create_by(tag_attribute)
            self.tags << tag
        end
    end



    # def reviews #all reviews for cat. Returns hash w/ reviewer, review, rating
    #     reviews = Review.select{|r| r.reservation.cat == self}
    #     reviews.map{|r| {reviewer: r.reservation.renter, review: r.renter_review, rating: r.renter_rating}}
    # end

    # def overall_rating #over-all rating as float. If no reviews, returns 0
    #     reviews.length > 0? (reviews.map{|r| r[:rating]}.sum / reviews.count).to_f : 0
    # end

    # def self.most_popular #returns 3 most popular by reservation count
    #     all.sort_by{|cat| cat.reservations.count}.reverse[0..2]
    # end

    # def self.featured #returns most popular cat by rating
    #     all.sort_by{|cat| cat.overall_rating}.last
    # end
end
