# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotificationJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later('share_video_notifications_channel', message: 'hello') }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .with('share_video_notifications_channel', message: 'hello')
      .on_queue('default')
  end

  it 'broadcasts to the correct channel' do
    expect(ActionCable.server).to receive(:broadcast).with('share_video_notifications_channel', message: 'hello')
    perform_enqueued_jobs { job }
  end
end
