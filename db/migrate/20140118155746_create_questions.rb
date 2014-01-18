class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, limit: 500
      t.string :content, limit: 3000
      t.integer :user_id, null: false
      t.integer :accepted_answer_id
      t.timestamps
    end
    add_index(:questions, :user_id)
    add_index(:questions, :accepted_answer_id)
  end
end
