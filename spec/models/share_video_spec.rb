# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShareVideo, type: :model do
  before do
    ActiveJob::Base.queue_adapter = :test
  end

  # These let statements are accessible in all examples within this block
  let(:user) { create(:user) } # Creates a user
  let(:share_video) { build(:share_video, user:) } # Builds a share_video associated with the user

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it 'is valid with a valid YouTube URL' do
      user = create(:user)
      video = build(:share_video, user:)
      expect(video).to be_valid
    end

    it 'is not valid with a dont have owner' do
      video = build(:share_video, user: nil)
      expect(video).not_to be_valid
    end

    it 'is not valid with an invalid YouTube URL' do
      user = create(:user)
      video = build(:share_video, user:, url: 'http://invalidurl.com')
      expect(video).not_to be_valid
      expect(video.errors.messages[:url]).to include('must be a valid YouTube URL')
    end
  end

  describe 'callbacks' do
    it 'calls update_title_and_desc before create' do
      expect_any_instance_of(ShareVideosService).to receive(:update_info)

      share_video.save!
    end

    # it 'broadcasts a notification after create' do
    #   expect(ActionCable.server).to receive(:broadcast)
    #     .with('share_video_notifications_channel', hash_including(:type, :metadata, :message))
    #   share_video.save!
    # end

    it 'calls send_delay_notification after create' do
      # Expect send_delay_notification to be called on it
      expect(share_video).to receive(:send_delay_notification)

      # When saving the share_video
      share_video.save!
    end

    it 'directly enqueues a job' do
      allow(NotificationJob).to receive(:perform_now)

      share_video.save!

      # Expect that send_delay_notification was indeed called
      expect(NotificationJob).to have_received(:perform_now)
        .with('share_video_notifications_channel', hash_including(type: :new_share_video, message: 'New video shared!'))
    end
  end
end
