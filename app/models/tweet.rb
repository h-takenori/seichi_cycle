class Tweet
  def self.tweet_checkpoint user, checkpoint
    text = %Q{#{checkpoint.name}へ到着しました。

聖地サイクリングからTweet
https://maps.google.com/maps?q=#{checkpoint.lat.to_s},#{checkpoint.lng.to_s}
https://seichi.ancouapp.com
}
    tweet user, text
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

  def self.read
    require 'nokogiri'

    fields = [:place, :lat, :lon]
    print fields.join("\t") + "\n"

    kml_file = '/Users/hiraotakenori/Downloads/mymap.kml'
    @doc = Nokogiri::XML(File.open(kml_file))
    p @doc.at_css('name').text
    @doc.css('Placemark').each do |placemark|
      name = placemark.at_css('name')
      coordinates = placemark.at_css('coordinates')
      lat,lon = coordinates.text.gsub("\n", "").gsub(" ", "").split(',')
      # p coordinates.text.gsub("\n", "").gsub(" ", "")
      # puts [name.text, lat, lon].join("\t")
    end
  end
end