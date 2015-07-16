class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @article = Article.find_by(id: params[:article_id])
  end

  def create
    comment = Comment.new(comment_params)
    article = Article.find_by(id: params[:article_id])
    if comment.save
      redirect_to article_path(article)
    else
      render :new
    end
  end

  def show_all
    @comments = Comment.where(user_id: session[:user_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: session[:user_id], article_id: params[:article_id])
  end
end
