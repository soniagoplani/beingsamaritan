class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	
    	
    	t.integer :post_id, null: false
    	t.text :body, null: false
    	t.string :name

      t.timestamps null: false
    end
  end
end
