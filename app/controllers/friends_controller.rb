class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
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
    params[:friend].permit(:name, :note)
  end
end
