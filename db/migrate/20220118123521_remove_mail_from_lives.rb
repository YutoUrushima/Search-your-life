class RemoveMailFromLives < ActiveRecord::Migration[5.2]
  def change
    remove_column :lives, :mail
  end
end
