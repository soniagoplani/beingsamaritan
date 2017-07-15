class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
       t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_no
      t.string :profession
      t.text :why_you_joining
      t.string :time_contribution
      t.references :organization
      t.timestamps null: false
    end
  end
end
