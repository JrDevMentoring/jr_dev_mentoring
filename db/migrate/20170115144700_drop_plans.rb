class DropPlans < ActiveRecord::Migration
  def change
    add_column :users, :plan_types, :string, array: true, default: []

    User.find_in_batches do |users|
      users.each do |user|
        user.update_column(:plan_types, user.plan.name)
      end
    end

    drop_table :plans
    remove_column :users, :plan_id
  end
end
