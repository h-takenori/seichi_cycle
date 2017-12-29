class Tweet
  def self.tweet_checkpoint user, checkpoint
    text = %Q{#{checkpoint.name}へ到着しました。

聖地サイクリングからTweet
https://maps.google.com/maps?q=#{checkpoint.lat.to_s},#{checkpoint.lng.to_s}
https://seichi.ancouapp.com
}
    # tweet user, text
  end

  def self.tweet user, text
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
    client.update(text)
  end
end