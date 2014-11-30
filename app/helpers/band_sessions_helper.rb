module BandSessionsHelper

	def log_in(band)
    session[:band_id] = band.id
  end

  def remember(band)
    band.remember
    cookies.permanent.signed[:band_id] = band.id
    cookies.permanent[:remember_token] = band.remember_token
  end

  def current_band(band)
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

  def logged_in?
    !current_band.nil?
  end

  def forget(band)
    band.forget
    cookies.delete(:band_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_band)
    session.delete(:band_id)
    @current_band = nil
  end
end
