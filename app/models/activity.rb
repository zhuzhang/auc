class Activity < ActiveRecord::Base
  validates :step_price, numericality: true
  validates :ok_price, numericality: true
  has_many :user_activities
  has_many :users, through: :user_activities

  has_many :activity_books
  has_many :books, through: :activity_books
end
