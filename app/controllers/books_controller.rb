class BooksController < ApplicationController
    before_filter :authenticate_user!
    before_action :require_book_info_with_the_ISBN_exists, only: [:create, :update]
    def index
        @books = current_user.books
    end
    def show
        @book = current_user.books.find(params[:id])
        @book_info = BookInfo.where(ISBN: @book.ISBN).take
    end
    def new
        @book = Book.new
    end
    def create
        @book = Book.find_or_initialize(book_params_ISBN, book_params_count)
        @user_book = UserBook.find_or_initialize(current_user, @book, book_params_count)
        if @book.save! && @user_book.save!
            redirect_to book_path(@book)
        else
            render 'new'
        end
    end
    def edit
        @book = current_user.books.find(params[:id])
        @book.total = @book.user_books.find_by_user_id(current_user).acount
    end
    def update
        @book = current_user.books.find(params[:id])
        @user_book = UserBook.where(user: current_user, book: @book).take
        @book.total += (book_params_count - @user_book.acount)
        @user_book.acount = book_params_count
        if @book.save! && @user_book.save!
            redirect_to @book
        else
            render 'edit'
        end
    end
    def destroy
        @book = current_user.books.find(params[:id])
        @user_book = UserBook.where(user: current_user, book: @book).take
        @book.total -= @user_book.acount
        @user_book.destroy
        @book.save
        redirect_to books_path
    end
    private
    def book_params
        params.require(:book).permit(:ISBN, :total)
    end
    def book_params_ISBN
        book_params['ISBN']
    end
    def book_params_count
        book_params['total'].to_i
    end
    def book_info_params
        params.require(:book_info).permit(:title, :author, :publisher, :publish_time)
    end
    def require_book_info_with_the_ISBN_exists
        unless BookInfo.where(ISBN: book_params_ISBN).exists?
            flash[:error] = "Can't find the book details with the ISBN in databases, Please check the ISBN number."
            @book = Book.new(book_params)
            render 'new'
        end
        unless book_params_count > 0
            flash[:error] = "The value of Total should be positive, Please check it."
            @book = Book.new(book_params)
            render 'new'
        end
    end
end
