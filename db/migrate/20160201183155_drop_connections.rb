class DropConnections < ActiveRecord::Migration
  def change
    drop_table :connections
  end
end
