class FriendsController < ApplicationController
  require "twitter"
  before_action :authenticate_user!

  def index
    @friends = current_user.friends

    @twitter_friends = current_user.twitter_friends.order('created_at DESC').all[0..5]
  end
  
  def refresh_twitter
    TwitterFriendsCollector.new.create_twitter_friends(current_user)
    redirect_to friends_path
  end

  def new
    @friend = Friend.new
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

  private
  def friend_params
    params[:friend].permit(:first_name, :last_name, :description, :phone_number, :email, :twitter_url, :facebook_url)
  end
end
