require_relative '20131028143854_create_books.rb'

class FixupTableMigration < ActiveRecord::Migration
  def change
      revert CreateBooks

      #TODO: some index should be added for some tables, such as title, ISBN and so on.
      # Book table
      create_table :books do |t|
          t.string :ISBN
          t.index :ISBN
          t.integer :total

          t.timestamps
      end

      # Book's info table
      create_table :book_infos do |t|
          t.string :ISBN
          t.string :title
          t.string :author
          t.string :publisher
          t.date :publish_time

          t.timestamps
      end

      # Book's category table
      create_table :book_categories do |t|
          t.string :lvl1
          t.string :lvl2

          t.timestamps
      end

      # The associate table between table books and table book_category.
      # n-n/has_and_belongs_to many
      create_table :book_categories_books, id: false do |t|
          t.belongs_to :book_category
          t.belongs_to :book
      end

      # The associate table between table users and table books.
      # n-n/has_many :through
      create_table :user_books do |t|
          t.belongs_to :user
          t.belongs_to :book
          t.integer :acount

          t.timestamps
      end

      # Activity table
      create_table :activities do |t|
          t.datetime :dead_line
          t.integer :step_price
          t.integer :ok_price
          t.string :status
          t.string :location

          t.timestamps
      end

      # The associate table between table users and table activities.
      # n-n/has_many :through
      create_table :user_activities do |t|
          t.belongs_to :user
          t.belongs_to :activity
          t.integer :price
          t.boolean :is_seller

          t.timestamps
      end

      # The associate table between table activities and table books
      # n-n/has_many :through
      create_table :activity_books do |t|
          t.belongs_to :activity
          t.belongs_to :book
          t.integer :count

          t.timestamps
      end

      # Ask_for table
      create_table :ask_fors do |t|
          t.belongs_to :user
          t.belongs_to :book
          t.integer :count

          t.timestamps
      end
  end
end
