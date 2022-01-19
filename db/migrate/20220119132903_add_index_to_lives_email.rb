class AddIndexToLivesEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :lives, :email, unique: true
  end
end
