class AddExpertUserToCampaigns < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns , :expert_user_id , :integer
  end
end
