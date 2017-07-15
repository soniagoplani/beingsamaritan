class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      
    	t.integer :event_id, null: false
    	t.string :name, null: false
    	t.string :phone, null: false
    	t.string :email
        t.text :address, null: false
    	
    	

      t.timestamps null: false
    end
  end
end
