class Video < ActiveRecord::Base
	belongs_to :band

	validates :title, presence: true, length: {maximum: 35}
	VALID_YOUTUBE_URL_REGEX = "^(http\:\/\/)?(www\.youtube\.com|youtu\.?be)\/.+$"
	validates :youtube_url, presence: true, format: { with: VALID_YOUTUBE_URL_REGEX }


end
