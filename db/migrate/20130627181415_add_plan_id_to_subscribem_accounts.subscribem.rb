# This migration comes from subscribem (originally 20130627165545)
class AddPlanIdToSubscribemAccounts < ActiveRecord::Migration
  def change
    add_column :subscribem_accounts, :plan_id, :integer
  end
end
