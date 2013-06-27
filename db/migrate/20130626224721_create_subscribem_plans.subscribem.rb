# This migration comes from subscribem (originally 20130626151036)
class CreateSubscribemPlans < ActiveRecord::Migration
  def change
    create_table :subscribem_plans do |t|
      t.string :name
      t.integer :amount
      t.string :braintree_id

      t.timestamps
    end
  end
end
