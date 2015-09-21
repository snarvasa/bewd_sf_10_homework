class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show] #authenticates dhh on every action, below

  def index
     @articles = Article.all                       #Lists all articles
  end

  def show                                         #Method to show the Article attributes
   @article = Article.find(params[:id])            #GETs the article ID
  end

  def new
    @article = Article.new                         #Creates a new article instance
  end

  def edit                                         #Method to edit the attributes of Article
    @article = Article.find(params[:id])           #GETs the article ID
  end

  def create
  @article = Article.new(article_params)           #Passes the new article params to @article

    if @article.save                                 #if @article saves to the DB, then
      redirect_to @article                           #redirect the user to the article show page
    else                                             #otherwise
      render 'new'                                   #render the new article form with the contents currently in @article
    end
  end

  def update                                        #Method to update Article
    @article = Article.find(params[:id])            #GETs the article ID, assigns it to @article

    if @article.update(article_params)              #if the article is updated
      redirect_to @article                          #redirect to the article show page
    else                                            #otherwise
      render 'edit'                                 #render the Edit page
    end
  end
end

  def destroy                                       #Method to destroy an article
    @article = Article.find(params[:id])            #GETS the article ID and stores it in @article
    @article.destroy                                #destroys the article

    redirect_to articles_path                       #redirects the user to the articles index
  end

private
  def article_params
    params.require(:article).permit(:title, :text)  #makes title + text privately available for any method requiring article params
  end
