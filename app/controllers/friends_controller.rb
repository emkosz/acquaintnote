class FriendsController < ApplicationController
  require "twitter"
  before_action :authenticate_user!

  def index
    @friends = current_user.friends

    user_id = current_user.uid.to_i
    @twitter_friends = TwitterFriendsCollector.new.create_twitter_friends(current_user, user_id)
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
