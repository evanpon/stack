class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :question_id, null: false
      t.string :content, null: false, limit: 100
      t.timestamps
    end
    add_index :tags, [:question_id, :content], unique: true
  end
end
