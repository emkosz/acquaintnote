require 'twitter'
class TwitterFriendsCollector

  def get_twitter_friends(user_id)
    $twitter_client.followers(user_uid)
  end

  def create_twitter_friends(current_user, user_uid)
    twitter_friends =  $twitter_client.followers(user_uid)
    recent_friends = twitter_friends[0..20]

    twitter_friends_array = []

    recent_friends.each do |friend|
      twitter_friend = TwitterFriend.find_or_create_by(twitter_handle: friend.screen_name)
      twitter_friend.user = current_user
      twitter_friend.name = friend.name
      # twitter_friend.uid = friend.id_str
      twitter_friend.save
      twitter_friends_array << twitter_friend
    end
    twitter_friends_array
  end
end
