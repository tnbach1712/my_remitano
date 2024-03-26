class ShareVideo < ApplicationRecord
  belongs_to :user

  before_create :update_title_and_desc
  after_create :broadcast_notification

  private
  def update_title_and_desc
    video_service = ShareVideosService.new self
    video_service.update_info
    self
  end

  def broadcast_notification
    ActionCable.server.broadcast('share_video_notifications_channel', { type: :new_share_video, metadata: self.as_json, message: 'New video shared!' })
  end

end
