class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string  :first_name
      t.string  :last_name
      t.string  :contact_email
      t.string  :city
      t.string  :state
      t.string  :country
      t.text    :coding_languages
      t.text    :bio
      t.text    :mentoring_needs
      
      t.timestamps
    end
  end
end