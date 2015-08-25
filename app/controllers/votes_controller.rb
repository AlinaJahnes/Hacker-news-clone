class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    article = Article.find_by(id: params[:id])
    vote = article.votes.build(vote_params)
    status = vote.user_can_vote? && vote.save
    notice = "You can only vote once per article."
    respond_to do |format|
      format.html {
        redirect_to :root, notice: notice unless status
      }
      format.json {render json: {status: status, notice: notice, id: article.id, count: article.votes.count}}
    end
  end

private

  def vote_params
      params.require(:vote).permit(:user_id, :article_id)
  end
end
