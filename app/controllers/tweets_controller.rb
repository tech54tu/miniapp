class TweetsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Tweet.create(tweets: tweet_params[:tweets], user_id: current_user.id)
    redirect_to action: 'index'
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    redirect_to action: 'index'
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id == current_user.id
    redirect_to action: 'index'
  end

  private
  def tweet_params
    params.permit(:tweets)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end