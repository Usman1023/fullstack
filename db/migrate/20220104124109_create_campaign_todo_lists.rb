class CreateCampaignTodoLists < ActiveRecord::Migration[6.1]
  def change
    create_table :campaign_todo_lists do |t|

      t.timestamps
    end
  end
end
