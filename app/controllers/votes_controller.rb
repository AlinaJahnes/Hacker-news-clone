class VotesController < ApplicationController
  def upvote_count
    @article = Article.find_by(id: params[:id])
    @article.increment!(:like_count)
    @count = @article.like_count
    if request.xhr?
      render json: {number: @count, id: @article.id.to_s }.to_json
    else
    redirect_to :root
    end
  end
end
