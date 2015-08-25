class ArticlesController < ApplicationController
  before_action :require_login, except: [:index]
  before_action :check_privileges, only: [:edit, :update]
  def index
    @articles = Article.all.order('created_at')
    @vote = Vote.new
  end

  def show
    @article = Article.find_by_id(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find_by_id(params[:id])
    if request.xhr?
      render partial: 'form', locals: {article: @article}, layout: false
    end
  end

  def update
    @article = Article.find_by_id(params[:id])
    @article.update(article_params)
    if request.xhr?
     	render partial: 'form', locals: {article: @article}, layout: false
    else
      redirect_to @article
    end
  end

  def destroy
    Article.find_by(id: params[:id]).destroy
    redirect_to user_path(current_user)
  end

  private
  def article_params
    params.require(:article).permit(:title, :body).merge(user_id: session[:user_id])
  end

  def check_privileges
    unless current_user.id == Project.find_by(id: params[:id]).creator_id
     redirect_to root_path, notice: "not authorized!"
    end
  end

end
