class CreateAuthorsBooks < ActiveRecord::Migration
  def change
    create_table :authors_books, id: false do |t|
      t.references :author
      t.references :book

      #t.timestamps
    end
    add_index :authors_books, :author_id
    add_index :authors_books, :book_id
  end
end
