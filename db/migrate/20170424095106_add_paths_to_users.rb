class AddPathsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :paths, :string
  end
end
