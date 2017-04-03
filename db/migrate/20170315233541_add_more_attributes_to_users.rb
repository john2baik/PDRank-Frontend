class AddMoreAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :age, :integer
    add_column :users, :location, :string
    add_column :users, :sex, :string
    add_column :users, :profession, :string
  end
end
