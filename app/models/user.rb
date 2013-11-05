class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :user_info, dependent: :destroy

  has_many :user_books
  has_many :books, through: :user_books

  has_many :user_activities
  has_many :activities, through: :user_activities

  has_many :ask_fors
end
