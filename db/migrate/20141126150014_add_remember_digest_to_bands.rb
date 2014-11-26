class AddRememberDigestToBands < ActiveRecord::Migration
  def change
    add_column :bands, :remember_digest, :string
  end
end
