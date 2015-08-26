class CommentsController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    article = Article.find_by(id: params[:article_id])
    comment = article.comments.build(comment_params)
    respond_to do |format|
      if comment.save
        format.html {render partial: 'comments/show', locals: {comment: comment}, layout: false}
      else
        format.html {redirect_to :back, notice: "Fail to save comment. Please try again."}
      end
    end
  end

  def show_all
    @user = User.find_by(id: params[:id])
    @comments = Comment.where(user_id: @user.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :article_id).merge(user_id: current_user.id)
  end
end
