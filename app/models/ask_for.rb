class AskFor < ActiveRecord::Base
  validates :count, numericality: true
  belongs_to :user
  belongs_to :book
end
