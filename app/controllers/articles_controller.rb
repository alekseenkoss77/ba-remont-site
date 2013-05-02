class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.order('created_at desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.joins(:city).where('cities.subdomain = ? AND articles.permalink = ?', request.subdomain, params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end
end
