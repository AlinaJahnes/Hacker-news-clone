class CommentsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  # def new
  #   @comment = Comment.new
  #   @article = Article.find_by(id: params[:article_id])
  #   if request.xhr?
  #     render partial: 'form', layout: false
  #   end
  # end

  def create
    article = Article.find_by(id: params[:article_id])
    comment = article.comments.build(comment_params)
    if comment.save && request.xhr?
      render json: {data: comment.content}.to_json
    # if comment.save
    #   redirect_to article
    else
      redirect_to :root
    end
  end

  def show_all
    @user = User.find_by(id: params[:id])
    @comments = Comment.where(user_id: @user.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :article_id).merge(user_id: session[:user_id])
  end
end
