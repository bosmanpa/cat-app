class CatReviewsController < ApplicationController
  before_action :authorized, only: [:new, :edit, :destroy]
  
  def new
    @cat_review = CatReview.new
    @reservation_id = params[:id]
    if session[:user_id] == Reservation.find_by(id: @reservation_id).renter_id
      render :new
    else 
      flash[:errors] = ["You are not authorized to review this cat!"] 
      redirect_to user_path(session[:user_id])
    end
  end
  
  def create
    @cat_review = CatReview.new(cat_review_params)
    if @cat_review.save
      redirect_to @cat_review.reservation
    else
      flash[:errors] = @cat_review.errors.full_messages
      redirect_to new_cat_review_path(params[:cat_review][:reservation_id])
    end
  end
  
  private
  
  def find_cat_review
    CatReview.find(params[:id])
  end
  
  def cat_review_params
    params.require(:cat_review).permit(:rating, :review, :reservation_id)
  end
  

end