# frozen_string_literal: true

class ShareVideosService
  include HTTParty
  base_uri 'https://www.googleapis.com/youtube/v3'

  def initialize(share_video)
    @share_video = share_video
  end

  def update_info
    res = get_info
    if res[:error].nil?
      @share_video.title = res["title"]
      @share_video.description = res["description"]
    end
    @share_video
  end

  def get_info
    video_id = extract_video_id(@share_video.url)
    response = self.class.get("/videos", query: {
      id: video_id,
      part: 'snippet',
      key: ENV['YOUTUBE_API_KEY']
    })
    if response.success?
      response.parsed_response["items"].first["snippet"]
    else
      { error: "Failed to fetch video info" }
    end
  end

  private

  def extract_video_id(url)
    uri = URI.parse(url)
    if uri.host == 'www.youtube.com' && uri.path == '/watch'
      CGI.parse(uri.query)['v'].first
    elsif uri.host == 'youtu.be'
      uri.path[1..-1]
    else
      nil
    end
  end
end
