class Cat < ApplicationRecord
    belongs_to :owner, class_name: 'User'
    has_many :reservations
    has_many :cat_tags
    has_many :tags, through: :cat_tags
    validates :name, presence: true


    def reviews #all reviews for cat. Returns hash w/ reviewer, review, rating
        reviews = Review.select{|r| r.reservation.cat == self}
        reviews.map{|r| {reviewer: r.reservation.renter, review: r.renter_review, rating: r.renter_rating}}
    end

    def overall_rating #over-all rating as float. If no reviews, returns 0
        reviews.length > 0? (reviews.map{|r| r[:rating]}.sum / reviews.count).to_f : 0
    end

    def self.most_popular #returns 3 most popular by reservation count
        all.sort_by{|cat| cat.reservations.count}.reverse[0..2]
    end

    def self.featured #returns most popular cat by rating
        all.sort_by{|cat| cat.overall_rating}.last
    end
end
