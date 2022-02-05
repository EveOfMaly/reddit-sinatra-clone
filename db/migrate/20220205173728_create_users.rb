class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :url 
      t.string :cakeday
      t.integer :karma_score
      t.string :password_digest
    end
  end
end
