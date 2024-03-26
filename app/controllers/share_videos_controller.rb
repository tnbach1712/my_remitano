# frozen_string_literal: true

class ShareVideosController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_share_video, only: %i[show edit update destroy]

  # GET /share_videos or /share_videos.json
  def index
    @share_videos = ShareVideo.includes(:user).all
  end

  # GET /share_videos/1 or /share_videos/1.json
  def show; end

  # GET /share_videos/new
  def new
    @share_video = ShareVideo.new
  end

  # GET /share_videos/1/edit
  def edit; end

  # POST /share_videos or /share_videos.json
  def create
    @share_video = current_user.share_videos.new(share_video_params)

    respond_to do |format|
      if @share_video.save
        format.html { redirect_to share_videos_url, notice: 'Share video was successfully created.' }
        format.json { render :show, status: :created, location: @share_video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @share_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_videos/1 or /share_videos/1.json
  def update
    respond_to do |format|
      if @share_video.update(share_video_params)
        format.html { redirect_to share_video_url(@share_video), notice: 'Share video was successfully updated.' }
        format.json { render :show, status: :ok, location: @share_video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @share_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_videos/1 or /share_videos/1.json
  def destroy
    @share_video.destroy

    respond_to do |format|
      format.html { redirect_to share_videos_url, notice: 'Share video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_share_video
    @share_video = ShareVideo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def share_video_params
    params.require(:share_video).permit(:url, :title, :description, :user_id)
  end
end
