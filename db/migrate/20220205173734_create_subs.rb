class CreateSubs < ActiveRecord::Migration[6.1]
  def change
    create_table :subs do |t|
        t.text :sub_title
        t.text :sub_url 
        t.text :sub_description
        t.text :sub_moderator
        t.integer :sub_member_count
        t.text :sub_create_date
    end
  end
end
