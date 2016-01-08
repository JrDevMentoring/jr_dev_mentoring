class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price
      
      t.timestamps
    end

    ['mentor', 'mentee'].each do |plan_name|
      Plan.create(
        name: plan_name
      )
    end
  end
end
