class Subject < ActiveRecord::Base
	has_many :tasks

	has_many :course_subjects
	has_many :courses, :through => :course_subjects

	has_many :user_subjects
	has_many :users, :through => :user_subjects

	has_many :tasks
end
