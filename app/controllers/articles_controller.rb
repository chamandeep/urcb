class ArticlesController < ApplicationController
    before_action :loged_in_user, only: [:index, :show, :edit, :destroy, :update]
    #before_action :correct_user,   only: [:edit, :update]

  # GET /articles
  def index
    @articles = Article.all
    @title = "Listing all Articles"
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
    @title = @article.title
  end

  # GET /articles/new
  def new
    @article = Article.new
    @title = "Post New Article"
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @title = "Editing Article"
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /articles/1
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:user_id, :title, :articleText, :Status)
    end
end
