class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def index
    @articles = Article.all
  end

  def show
    set_article
  end

  def edit
    set_article
  end

  def update
    if set_article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    set_article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
