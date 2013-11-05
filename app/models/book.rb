class Book < ActiveRecord::Base
  validates :ISBN, presence: true, uniqueness: true
  validates :total, numericality: true
  has_and_belongs_to_many :book_categories

  has_many :user_books
  has_many :users, through: :user_books

  has_many :activity_books
  has_many :activities, through: :activity_books

  has_many :ask_fors
  def self.find_or_initialize(book_params_ISBN, book_params_count)
    if Book.where(ISBN: book_params_ISBN).exists?
      book = Book.where(ISBN: book_params_ISBN).take
      book.total += book_params_count
    else
      book = Book.new(ISBN: book_params_ISBN, total: book_params_count)
    end
    book
  end
end
