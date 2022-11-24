class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order(created_at: :asc)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new 
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user

    if @tweet.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_enitity
    end
  end

  def destroy
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
