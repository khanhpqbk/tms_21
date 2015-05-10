class AddInstructionToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :instruction, :text
  end
end
