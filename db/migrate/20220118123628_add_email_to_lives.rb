class AddEmailToLives < ActiveRecord::Migration[5.2]
  def change
    add_column :lives, :email, :string
  end
end
