class ReviewsController < ApplicationController
  before_action :set_reviewable_item

  def show
    @review = @reviewable_item.reviews.find(params[:id])
  end

  def new
    @review = @reviewable_item.reviews.build
  end

  def create
    @review = @reviewable_item.reviews.create(review_params)
    if @review.save && params[:song_id]
      redirect_to artist_song_path(@reviewable_item, @reviewable_item)
    elsif @review.save && params[:artist_id]
      redirect_to artist_path(@reviewable_item)
    else
      render 'new'
    end
  end

  private
    def set_reviewable_item
      reviewable_item = [Artist, Song].detect{|c| params["#{c.name.underscore}_id"]}
      @reviewable_item = reviewable_item.find(params["#{reviewable_item.name.underscore}_id"])
    end

    def review_params
      params.require(:review).permit(:reviewer, :rating, :review)
    end
end
