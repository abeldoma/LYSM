class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.integer :band_id
    	t.string :band_name
    	t.string :title
    	t.string :youtube_url



      t.timestamps
    end
  end
end
