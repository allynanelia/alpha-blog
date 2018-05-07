class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect #show what happens
    @article = Article.new(article_params) #need to create new article from the params passed in, uses a method
    @article.save
    redirect_to articles_show(@article)
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
