# frozen_string_literal: true
require "test_helper"

class ShareVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @share_video = share_videos(:one)
  end

  test "should get index" do
    get share_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_share_video_url
    assert_response :success
  end

  test "should create share_video" do
    assert_difference("ShareVideo.count") do
      post share_videos_url, params: { share_video: { description: @share_video.description, title: @share_video.title, url: @share_video.url, user_id: @share_video.user_id } }
    end

    assert_redirected_to share_video_url(ShareVideo.last)
  end

  test "should show share_video" do
    get share_video_url(@share_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_share_video_url(@share_video)
    assert_response :success
  end

  test "should update share_video" do
    patch share_video_url(@share_video), params: { share_video: { description: @share_video.description, title: @share_video.title, url: @share_video.url, user_id: @share_video.user_id } }
    assert_redirected_to share_video_url(@share_video)
  end

  test "should destroy share_video" do
    assert_difference("ShareVideo.count", -1) do
      delete share_video_url(@share_video)
    end

    assert_redirected_to share_videos_url
  end
end
