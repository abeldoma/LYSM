class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include BandSessionsHelper

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  helper_method :current_user

  def current_band(band_id)
    if (band_id = session[:band_id])
      @current_band ||= Band.find_by(id: band_id)
    elsif (band_id = cookies.signed[:band_id])
      band = Band.find_by(id: band_id)
      if band && band.authenticated?(cookies[:remember_token])
        log_in band
        @current_band = band
      end
    end
  end
  helper_method :current_band
end
