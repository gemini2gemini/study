class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :book
      t.references :user
      t.text :body

      t.timestamps
    end
    add_index :reviews, :book_id
    add_index :reviews, :user_id
  end
end
