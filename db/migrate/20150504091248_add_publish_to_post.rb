class AddPublishToPost < ActiveRecord::Migration
  def change
    add_column :posts, :published, :bool
    add_column :posts, :publication_date, :date

    add_index :posts, [:publication_date, :published]
  end
end
