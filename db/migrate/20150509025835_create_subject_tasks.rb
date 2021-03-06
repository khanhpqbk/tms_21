class CreateSubjectTasks < ActiveRecord::Migration
  def change
    create_table(:subject_tasks) do |t|
      t.integer :subject_id
      t.integer :task_id

      t.timestamps null: false
    end

    add_index(:subject_tasks, :subject_id)
    add_index :subject_tasks, :task_id
    add_index :subject_tasks, [:subject_id, :task_id], unique: true
  end
end
