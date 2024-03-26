# frozen_string_literal: true

json.extract! share_video, :id, :url, :title, :description, :user_id, :created_at, :updated_at
json.url share_video_url(share_video, format: :json)
