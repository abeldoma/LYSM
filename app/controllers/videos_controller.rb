class VideosController < ApplicationController

  def index
  	@band = current_band params[:band_name]
    @videos = Video.all
    render 'no_videos' if @videos.empty?
	end

  def show
    @video = Video.find_by(title: params[:title])
  end
	def new
		@band = current_band params[:band_id]
		@video = @band.videos.new
	end

	def create
		@band = current_band params[:band_id]
		@video = @band.videos.new video_params

		if @video.save
			redirect_to action: :index, controller: :videos, band_id: @band.id
		else
			render 'new'
		end
  end

  private

  def video_params
    params.require(:video).permit(:title, :youtube_url)
  end
end
