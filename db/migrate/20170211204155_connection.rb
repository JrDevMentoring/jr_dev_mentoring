class Connection < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :requester, index: true
      t.references :requested, index: true

      t.timestamps null: false
    end
  end
end
