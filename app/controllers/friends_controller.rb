class FriendsController < ApplicationController
  require "twitter"
  before_action :authenticate_user!

  def index
    @friends = current_user.friends
  end

  def recent_friends
    @twitter_friends = current_user.twitter_friends.order('created_at DESC').all[0..10]
    if @twitter_friends.count == 0
      @twitter_friends = TwitterFriendsCollector.new.create_twitter_friends(current_user)
    end
  end

  def refresh_twitter
    TwitterFriendsCollector.new.create_twitter_friends(current_user)
    redirect_to recent_friends_path
  end

  def new
    @friend = Friend.new
    if params[:twitter_handle]
      handle = params[:twitter_handle]
      @friend.twitter_url = "https://twitter.com/#{handle}"
      twitter_friend = TwitterFriend.find_by(user: current_user, twitter_handle: handle)
      @friend.first_name = twitter_friend.name
      @friend.description = twitter_friend.twitter_bio
    end
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user = current_user
    if @friend.save
      flash[:success] = "Added new contact"
      redirect_to friends_path
    else
      flash[:error] = "There was an error adding the new contact."
      render action: :new
    end
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    if @friend.update_attributes(friend_params)
      redirect_to friends_path
    end
  end

  private
  def friend_params
    params[:friend].permit(:first_name, :last_name, :description, :phone_number, :email, :twitter_url, :facebook_url)
  end
end
