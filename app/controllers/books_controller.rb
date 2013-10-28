class BooksController < ApplicationController
    before_filter :authenticate_user!
    def index
    end
    def show
        @book = current_user.books.find(params[:id])
    end
    def new
        @book = current_user.books.build
    end
    def create
        @book = current_user.books.create(params[:book].permit(:title, :author, :publisher, :amount))
        redirect_to book_path(@book)
    end
    def edit
        @book = current_user.books.find(params[:id])
    end
    def update
        @book = current_user.books.find(params[:id])
        if @book.update(params[:book].permit(:title, :author, :publisher, :amount))
            redirect_to @book
        else
            render 'edit'
        end
    end
    def destroy
        @book = current_user.books.find(params[:id])
        @book.destroy
        redirect_to book_path(@post)
    end
end
