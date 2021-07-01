class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.integer :user_id, null: false
      t.integer :total_score, null: false
      t.date :played_at, null: false

      t.timestamps
    end

    add_index :scores, :user_id
  end
end
