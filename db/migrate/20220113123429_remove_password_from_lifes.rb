class RemovePasswordFromLifes < ActiveRecord::Migration[5.2]
  def change
    remove_column :lives, :password
  end
end
