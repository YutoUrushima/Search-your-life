class AddRememberDigestToLives < ActiveRecord::Migration[5.2]
  def change
    add_column :lives, :remember_digest, :string
  end
end
