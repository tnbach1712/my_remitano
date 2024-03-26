# frozen_string_literal: true

class ShareVideoNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'share_video_notifications_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
