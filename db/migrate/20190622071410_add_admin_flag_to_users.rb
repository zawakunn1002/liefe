class AddAdminFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin_flag, :integer
  end
end
