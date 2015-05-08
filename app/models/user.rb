class User < ActiveRecord::Base
	has_secure_password

	has_many :user_courses
	has_many :courses, :through => :user_courses

	has_many :user_subjects
	has_many :subjects, :through => :user_subjects

	has_many :user_tasks
	has_many :tasks, :through => :user_tasks

	validates :password, length: {minimum: 6}, allow_blank: true


	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
end
