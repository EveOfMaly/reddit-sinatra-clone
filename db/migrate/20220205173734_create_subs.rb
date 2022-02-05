class CreateSubs < ActiveRecord::Migration[6.1]
  def change
    create_table :subs do |t|
      t.string :title
      t.string :url 
      t.string :description
      t.string :moderator
        t.integer :member_count
        t.string :create_date
    end
  end
end
