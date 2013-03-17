class CreateFunComments < ActiveRecord::Migration
  def change
    create_table :fun_comments do |t|
      t.integer :author_no
      t.string :name
      t.text :body
      t.boolean :deleted

      t.timestamps
    end
  end
end
