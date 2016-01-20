class AddEvalFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :gameteam, :boolean, default: false
    add_column :users, :score, :integer, default: 0
    add_column :users, :age, :integer, default: 0
  end
end
