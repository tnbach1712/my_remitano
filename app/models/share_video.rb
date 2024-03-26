class ShareVideo < ApplicationRecord
  belongs_to :user

  before_create :update_title_and_desc

  def update_title_and_desc
    video_service = ShareVideosService.new self
    video_service.update_info
    self
  end

end
