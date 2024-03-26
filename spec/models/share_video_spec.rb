require 'rails_helper'

RSpec.describe ShareVideo, type: :model do
  # These let statements are accessible in all examples within this block
  let(:user) { create(:user) } # Creates a user
  let(:share_video) { build(:share_video, user: user) } # Builds a share_video associated with the user
  
  describe "validations" do
    it "is valid with valid attributes" do
      expect(share_video).to be_valid
    end
    
    it "is invalid without a URL" do
      share_video.url = nil
      expect(share_video).not_to be_valid
    end
  end
  
  describe "callbacks" do
    it "calls update_title_and_desc before create" do
      expect_any_instance_of(ShareVideosService).to receive(:update_info)
      share_video.save!
    end
    
    it "broadcasts a notification after create" do
      expect(ActionCable.server).to receive(:broadcast)
        .with('share_video_notifications_channel', anything)
      share_video.save!
    end
  end
end
