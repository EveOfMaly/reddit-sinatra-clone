class CreatePostSubs < ActiveRecord::Migration[6.1]
  def change
    create_table :postsubs do |t|
      t.integer :post_id
      t.integer :sub_id
    end
  end
end
