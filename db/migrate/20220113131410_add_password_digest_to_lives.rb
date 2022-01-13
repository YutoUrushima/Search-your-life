class AddPasswordDigestToLives < ActiveRecord::Migration[5.2]
  def change
    add_column :lives, :password_digest, :string
  end
end
