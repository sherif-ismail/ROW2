class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :driving, :boolean, default: false
    add_column :users, :license, :boolean, default: false
  end
end
