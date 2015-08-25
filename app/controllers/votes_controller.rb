class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @article = Article.find_by(id: params[:id])
    @vote = @article.votes.build(vote_params)
    # if @vote.save && request.xhr?
    #   render json: {data: @article.votes.count}.to_json
    # else
    # end
    if @vote.save && request.xhr?
      render json: {id: @article.id, number: @article.votes.count}.to_json
    else
      redirect_to :root, notice: "Fail to vote"
    end
  end

  # def upvote_count
  #   @article = Article.find_by(id: params[:id])
  #   @article.increment!(:like_count)
  #   @count = @article.like_count
  #   if request.xhr?
  #     render json: {number: @count, id: @article.id.to_s }.to_json
  #   else
  #   redirect_to :root
  #   end
  # end

private

  def vote_params
      params.require(:vote).permit(:user_id, :article_id)
  end
end
