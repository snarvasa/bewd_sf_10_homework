class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = get_review
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render "new"
    end
  end

  def edit
    @review = get_review
  end

  def update
    @review = get_review
    if @review.update(review_params)
      redirect_to review_path(@review), notice: "Review Successfully Created"
    else
      render "edit"
    end
  end

  def destroy
    @review = get_review
    @review.review
    redirect_to review_path
  end

  private

  def get_review
    Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :name, :review_body)
  end

end
