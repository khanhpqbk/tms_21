class AddStartDateToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :start_date, :datetime
  end
end
