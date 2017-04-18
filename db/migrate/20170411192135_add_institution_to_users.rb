class AddInstitutionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :institution, :string
  end
end
