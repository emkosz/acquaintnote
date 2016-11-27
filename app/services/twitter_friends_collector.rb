require 'twitter'
class TwitterFriendsCollector

  def create_twitter_friends(current_user)
    user_uid = current_user.uid.to_i
    twitter_friends =  $twitter_client.friends(user_uid)
    twitter_friends_array = []
    count = 0
    twitter_friends.each do |friend|
      twitter_friend = TwitterFriend.find_or_create_by(twitter_handle: friend.screen_name)
      twitter_friend.user = current_user
      twitter_friend.name = friend.name
      # twitter_friend.uid = friend.id_str
      twitter_friend.save
      twitter_friends_array << twitter_friend
      count += 1
      if count == 20 then
        break
      end
    end
    twitter_friends_array
  end
end
