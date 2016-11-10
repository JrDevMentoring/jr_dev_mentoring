class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.string :title
      t.string :description
      t.string :application_link
      t.date :deadline
      t.references :user, index: true

      t.timestamps
    end
  end
end
