class CreateBookTags < ActiveRecord::Migration
  def change
    create_table :book_tags do |t|
      t.integer :book_id
      t.integer :tag_id

      t.timestamps
    end

    add_index :book_tags, :book_id,    unique: true
    add_index :book_tags, :tag_id,     unique: true
  end
end