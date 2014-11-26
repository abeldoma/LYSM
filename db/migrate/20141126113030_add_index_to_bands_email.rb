class AddIndexToBandsEmail < ActiveRecord::Migration
  def change
  	add_index :bands, :email, unique: true
  end
end
