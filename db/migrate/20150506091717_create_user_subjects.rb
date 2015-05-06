class CreateUserSubjects < ActiveRecord::Migration
  def change
    create_table :user_subjects do |t|
      t.integer :user_id
      t.integer :subject_id

      t.timestamps null: false
    end

    add_index :user_subjects, :user_id
    add_index :user_subjects, :subject_id
    add_index :user_subjects, [:user_id, :subject_id], unique: true
  end
end
