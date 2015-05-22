class AddCustomCssAndJsToPosts < ActiveRecord::Migration
  def change
	add_column :posts, :css, :text
	add_column :posts, :js, :text
	
  end
end
