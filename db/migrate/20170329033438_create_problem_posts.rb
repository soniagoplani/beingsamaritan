class CreateProblemPosts < ActiveRecord::Migration
  def change
    create_table :problem_posts do |t|
    	t.string :title , null: false
    	t.string :category_name, null: false
    	t.integer :category_id, null: false
    	t.text :content, null: false
    	t.string :name, null: false

      t.timestamps null: false
    end
  end
end
