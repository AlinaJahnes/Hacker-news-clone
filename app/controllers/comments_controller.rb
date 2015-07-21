class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @article = Article.find_by(id: params[:article_id])
    if request.xhr?
      render partial: 'form', layout: false
    end
  end

  def create
    comment = Comment.new(comment_params)
    # This comment doesn't appear to be associated with an article b/c you don't use the article variable on the next line anywhere else.
    article = Article.find_by(id: params[:article_id])
    if comment.save && request.xhr?
      render json: {data: comment.content}.to_json
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
