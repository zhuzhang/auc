class UserBook < ActiveRecord::Base
  validates :acount, numericality: true
  belongs_to :user
  belongs_to :book
  def self.find_or_initialize(user, book, book_params_count)
    if UserBook.where(book: book, user: user).exists?
      user_book = UserBook.where(book: book, user: user).take
      user_book.acount += book_params_count
    else
      user_book = UserBook.new(acount: book_params_count, book: book, user: user)
    end
    user_book
  end
end
