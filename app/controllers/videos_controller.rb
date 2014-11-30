class VideosController < ApplicationController

  def index
    @videos = current_band.videos.all
    render 'no_videos' if @videos.empty?
	end

	def new
		@band = current_band params[:band_id]
		@video = @band.videos.new
	end

	def create
		@band = current_band.find params[:band_id]
		@video = @band.videos.new video_params

		if @video.save
			redirect_to action: :index, controller: :videos, band_id: @band.band_id
		else
			render 'new'
		end
  end

  private

  def video_params
    params.require(:video).permit(:title, :youtube_url)
  end
end
