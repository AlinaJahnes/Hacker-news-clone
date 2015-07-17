class VotesController < ApplicationController
  # def new
  #   @vote = Vote.new
  # end

  # def create
  # end

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

private

# def vote_params
#     params.require(:vote).permit(:user_id, :article_id)
#   end
# end
end
