class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.references :user
      t.string :name
      t.date :birth
      t.text :address
      t.string :ctype
      t.binary :photo

      t.timestamps
    end
    add_index :authors, :user_id
  end
end
