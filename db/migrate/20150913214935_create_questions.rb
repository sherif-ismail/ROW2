class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.text :choice1
      t.text :choice2
      t.text :choice3
      t.text :choice4
      t.string :category
      t.string :path

      t.timestamps null: false
    end
  end
end
