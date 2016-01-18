class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.boolean :flow, default: false
      t.boolean :knowledge, default: false
      t.text :result
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
