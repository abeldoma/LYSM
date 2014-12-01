class Video < ActiveRecord::Base
	belongs_to :band


	validates :title, presence: true, length: {maximum: 35}
	yt_regexp = /https:\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)/
	validates :youtube_url, presence: true, format: { with: yt_regexp }


end
