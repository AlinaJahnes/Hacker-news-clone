class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @article = Article.find_by(id: params[:id])
    @vote = @article.votes.build(vote_params)
    # if @vote.user_can_vote? && @vote.save && request.xhr?
    #   render json: {id: @article.id, number: @article.votes.count, status: true}.to_json
    # elsif request.xhr?
    #   render json: {notice: "You can only vote once.", status: false}.to_json
    # end
    if @vote.user_can_vote? && @vote.save && request.xhr?
      render json: {id: @article.id, number: @article.votes.count}.to_json
    else
      flash[:notice] = "You can only vote once per article."
      redirect_to :root
    end
  end

private

  def vote_params
      params.require(:vote).permit(:user_id, :article_id)
  end
end
