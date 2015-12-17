class AddNotAvailableToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :not_available, :boolean, :default => false
  end
end
