class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string  :title
      t.string :description
      t.string :slug
      t.string :link 
      t.string  :content
      t.string :author
      t.integer :user_id
      t.integer :sub_id
    end
  end
end
