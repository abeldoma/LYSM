class BandsController < ApplicationController

	def show
		@band = Band.find(params[:id])
	end

	def new
		@band = Band.new
	end

	def create
		@band = Band.new(band_params)
		if @band.save
			log_in @band
			flash[:success] = "Welcome to LYSM!"
			redirect_to @band
		else
			render 'new'
		end
	end

	private

		def band_params
			params.require(:band).permit(:name, :email, :password, :password_confirmation)
		end

		def logged_in_band
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end