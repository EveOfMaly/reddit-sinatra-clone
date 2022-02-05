class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :user_username
      t.text :user_url 
      t.text :user_cakeday
      t.integer :karma_score
    end
  end
end
