class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :your_name
      t.string :email
      t.text :mentors_name
      t.text :mentees_name
      
      t.timestamps
    end
  end
end
