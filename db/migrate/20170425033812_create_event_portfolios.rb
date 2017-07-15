class CreateEventPortfolios < ActiveRecord::Migration
  def change
    create_table :event_portfolios do |t|
     t.string :event_name , null: false
    	t.string :organization_name, null: false
    	t.date :event_date, null: false
    	t.time :event_start, null: false
    	t.time :event_end, null: false
    	t.string :event_loc, null: false
    	t.string :coordinator_name, null: false
    	t.string :description, null: false
    	t.string :participants, null: false
    	t.string :highlights, :array =>true,null: false
    	t.attachment :avatar, null: false
      t.timestamps null: false
    end
  end
end
