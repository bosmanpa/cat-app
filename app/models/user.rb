class User < ApplicationRecord
has_many :cats, foreign_key: 'owner_id'
has_many :owner_reservations, through: :cats, source: :reservations
has_many :reservations, foreign_key: 'renter_id'
has_many :rented_cats, through: :reservations, source: :cat

has_secure_password
validates :name, presence: true
validates :username, presence: true, uniqueness: true
validates :password, presence: true
validates :password, confirmation: {case_sensitive: true}
validates :password, length: {minimum: 5}

  def top_3_cats #top 3 highest rated cats. If no cats, returns nil
   cats.length > 0 ? cats.sort_by{|cat| cat.overall_rating}.reverse[0..2] : nil
  end


  def self_reviews_as_renter #Reviews of user as the renter
    reservations.map{|r| r.renter_review}
  end

  def written_reviews
    reservations.map{|r| r.cat_review} + owner_reservations.map{|r| r.renter_review}
  end


end
