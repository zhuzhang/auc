class UserActivity < ActiveRecord::Base
  validates :price, numericality: true
  belongs_to :user
  belongs_to :activity
end
