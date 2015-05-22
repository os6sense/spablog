class Post < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string  :title, null: false
      t.text    :content, null:false
      t.timestamps null: false
    end
  end

  def down
    drop_table :posts
  end
end
