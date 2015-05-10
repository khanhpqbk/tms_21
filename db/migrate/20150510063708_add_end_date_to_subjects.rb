class AddEndDateToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :end_date, :datetime
  end
end
