class ActivityBook < ActiveRecord::Base
  validates :count, numericality: true
  belongs_to :activity
  belongs_to :book
end
