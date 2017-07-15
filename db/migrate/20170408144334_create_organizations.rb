class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :head_name, null: false
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pin_code
      t.string :status
      t.references :user

      t.timestamps null: false
    end
  end
end
