class CreateProblemCategories < ActiveRecord::Migration
  def change
    create_table :problem_categories do |t|
    	t.string :name_category, null: false

      t.timestamps null: false
    end
  end
end
