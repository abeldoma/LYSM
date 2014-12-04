class VideosController < ApplicationController

  def index
    @videos = if (@filter_by = params[:filter_by] || "votes") == "votes"
  	  Video.all.sort { |v1, v2| v2.reputation_for(:votes) <=> v1.reputation_for(:votes) }
    else
      Video.order("title asc")
    end
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

  def vote

  	value = params[:type] == "up" ? 1 : -1
  	@video = Video.find(params[:id])
    unless @video.evaluators_for(:votes).include?(current_user)
  	 @video.add_evaluation(:votes, value, current_user)
  	 flash[:success] = "Thanks for voting!"
    end
  	redirect_to current_user
  end


  private

  def video_params
    params.require(:video).permit(:title, :youtube_url)
  end
end
