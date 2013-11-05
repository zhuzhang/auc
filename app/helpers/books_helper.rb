module BooksHelper
    def get_book_count_by_user_book(user, book)
        @user_book = UserBook.where(book: book, user: user).take
        @user_book.acount
    end
end
