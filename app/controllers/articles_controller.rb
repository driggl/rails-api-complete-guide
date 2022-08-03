class ArticlesController < ApplicationController
  skip_before_action :authorize!, only: [:index, :show]

  def index
    articles = Article.recent.
      page(current_page).
      per(per_page)
    render json: articles
  end

  def show
    render json: Article.find(params[:id])
  end

  def create
    article = current_user.articles.build(article_params)
    article.save!
    render json: article, status: :created
  end

  def update
    article = current_user.articles.find(params[:id])
    article.update_attributes!(article_params)
    render json: article, status: :ok
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy
    head :no_content
  rescue
    authorization_error
  end

  private

  def article_params
    params.require(:data).require(:attributes).
      permit(:title, :content, :slug) ||
    ActionController::Parameters.new
  end
end
