class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text  :post_title
      t.text :post_description
      t.text :post_url
      t.text :post_link 
      t.text  :post_content
      t.text  :post_author
      t.integer :user_id
      t.integer :sub_id
    end
  end
end
