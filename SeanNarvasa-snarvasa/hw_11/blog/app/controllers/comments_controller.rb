class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy #authenticates dhh on every action, below

  def create                                                  #method to create a comment
    @article = Article.find(params[:article_id])              #GETs the article_ID
    @comment = @article.comments.create(comment_params)       #creates a comment and links the comment to this article
    redirect_to article_path(@article)                        #redirects the user to the original article
  end

  def destroy                                                 #method to destroy a comment
    @article = Article.find(params[:article_id])              #GETs the article ID
    @comment = @article.comments.find(params[:id])            #GETs the associated comment
    @comment.destroy                                          #Destroys the comment
    redirect_to article_path(@article)                        #redirects the user to the original article
  end

  private
    def comment_params                                        #private method to pass comment parameters
      params.require(:comment).permit(:commenter, :body)      #makes commenter and comment body privately available to methods within the comment controller
    end
end
