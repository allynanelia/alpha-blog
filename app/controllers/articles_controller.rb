class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy] #before these actions do anything, access method set_article

  def index
    @articles = Article.all
  end

  def new #action
  @article = Article.new #will be passed to the view page
  end

  def edit
  end

  def create #action, handles form submission from new page
    #render plain: params[:article].inspect #show what happens
    @article = Article.new(article_params) #need to create new article from the params passed in, uses a method

    if @article.save
      flash[:notice] = "Article was successfully created." #only for one cycle
      redirect_to article_path(@article)
    else #if article does not pass the validations of save
    render 'new' #show the new template again
    end

  end

  def update #action that handles form from edit page
    if @article.update(article_params) #params is an instance of Parameter in controller; looks like a hash
      flash[:notice] = "Article was successfully edited"
      redirect_to article_path(@article) #redirecting to 'show' page
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
  end

  private
    def set_article
      @article = Article.find(params[:id]) # param in url
    end

    #this validation is for form inputs
    def article_params #to whitelist values being passed, from params, will allow these attributes
      params.require(:article).permit(:title, :description) #article is the key, title and description are values
    end

end
