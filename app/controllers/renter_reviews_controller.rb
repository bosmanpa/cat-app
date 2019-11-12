class RenterReviewsController < ApplicationController
  before_action :authorized, only: [:new, :edit, :destroy]
end