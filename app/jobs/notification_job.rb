# frozen_string_literal: true

class NotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # ActionCable.server.broadcast('share_video_notifications_channel',
    #   { type: :new_share_video, metadata: as_json, message: 'New video shared!' })
    ActionCable.server.broadcast(*args)
  end
end
