class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    
      t.string :name
      t.datetime :scheduled_at
      t.integer :duration
      t.string :location
      t.string :coordinator_name
      t.string :coordinator_email
      t.string :coordinator_phone
      t.text :moto
      t.text :who_can_participate
      t.string :event_cost

      t.references :user
      t.timestamps null: false
    
 
    end
  end
end
