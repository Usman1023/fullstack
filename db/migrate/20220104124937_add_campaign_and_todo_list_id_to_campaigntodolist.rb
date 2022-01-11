class AddCampaignAndTodoListIdToCampaigntodolist < ActiveRecord::Migration[6.1]
  def change
    add_column :campaign_todo_lists , :campaign_id , :integer
    add_column :campaign_todo_lists , :todo_list_id , :integer
  end
end
