class BandSessionsController < ApplicationController
  def new
  end

  def create
    band = Band.find_by(email: params[:band_session][:email].downcase)
    if band && band.authenticate(params[:band_session][:password])
    	session[:band_id] = band.id
    	remember band
    	params[:band_session][:remember_me] == '1' ? remember(band) : forget(band)
    	redirect_to band
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
