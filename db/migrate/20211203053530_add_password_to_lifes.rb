class AddPasswordToLifes < ActiveRecord::Migration[5.2]
  def change
    add_column :lives, :password, :string
  end
end
