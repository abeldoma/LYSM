class AddPasswordDigestToBands < ActiveRecord::Migration
  def change
    add_column :bands, :password_digest, :string
  end
end
