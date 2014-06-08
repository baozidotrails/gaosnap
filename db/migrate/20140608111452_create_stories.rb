class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.integer :dog_id

      t.timestamps
    end
  end
end
