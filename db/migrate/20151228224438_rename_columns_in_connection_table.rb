class RenameColumnsInConnectionTable < ActiveRecord::Migration
  def change
    rename_column :connections, :mentors_name, :connections_name
    remove_column :connections, :mentees_name
  end
end
