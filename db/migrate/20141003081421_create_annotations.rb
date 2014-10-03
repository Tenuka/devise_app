class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.text :content
      t.references :user, index: true
      t.references :chapter, index: true

      t.timestamps
    end
  end
end
