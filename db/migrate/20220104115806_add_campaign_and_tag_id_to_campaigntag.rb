class AddCampaignAndTagIdToCampaigntag < ActiveRecord::Migration[6.1]
  def change
    add_column :campaign_tags , :campaign_id , :integer
    add_column :campaign_tags , :tag_id , :integer
  end
end
