# frozen_string_literal: true

class ShareVideo < ApplicationRecord
  belongs_to :user

  before_create :update_title_and_desc
  after_create :broadcast_notification

  validates_format_of :url, with: %r{\A(https?://)?(www\.)?(youtube\.com/watch\?v=|youtu\.be/)[\w-]{11}(&[\w=&]*)*\z},
                            message: 'must be a valid YouTube URL'

  private

  def update_title_and_desc
    video_service = ShareVideosService.new self
    video_service.update_info
    self
  end

  def broadcast_notification
    ActionCable.server.broadcast('share_video_notifications_channel',
                                 { type: :new_share_video, metadata: as_json, message: 'New video shared!' })
  end
end
