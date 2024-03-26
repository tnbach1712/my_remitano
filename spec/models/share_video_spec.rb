require 'rails_helper'

RSpec.describe ShareVideo, type: :model do
  describe 'callbacks' do
    let(:user) { create(:user) } # Assuming you have a factory for users
    let(:share_video) { build(:share_video, user: user) } # Assuming you have a factory for share_videos

    it 'calls update_title_and_desc before create' do
      service_double = instance_double("ShareVideosService")
      allow(ShareVideosService).to receive(:new).with(share_video).and_return(service_double)
      expect(service_double).to receive(:update_info)

      share_video.save!
    end

    it 'broadcasts a notification after create' do
      expect(ActionCable.server).to receive(:broadcast)
        .with('share_video_notifications_channel',
              { type: :new_share_video, metadata: share_video.as_json, message: 'New video shared!' })

      share_video.save!
    end
  end
end
