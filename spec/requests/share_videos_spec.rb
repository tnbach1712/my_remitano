require 'rails_helper'

RSpec.describe "ShareVideos", type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) { { url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', title: 'A Cool Video', description: 'A cool video description' } }
  let(:invalid_attributes) { { url: '', title: '', description: '' } }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      ShareVideo.create! valid_attributes.merge(user: user)
      get share_videos_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      share_video = ShareVideo.create! valid_attributes.merge(user: user)
      get share_video_url(share_video)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ShareVideo and redirects" do
        expect {
          post share_videos_url, params: { share_video: valid_attributes }
        }.to change(ShareVideo, :count).by(1)
        
        expect(response).to redirect_to(share_videos_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new ShareVideo" do
        expect {
          post share_videos_url, params: { share_video: invalid_attributes }
        }.to change(ShareVideo, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
