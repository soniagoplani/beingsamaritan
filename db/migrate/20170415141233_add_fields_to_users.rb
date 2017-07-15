class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profession, :string
    add_column :users, :why_you_joining, :string
    add_column :users, :how_much_time, :string
  end
end
