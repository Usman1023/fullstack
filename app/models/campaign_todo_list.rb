class CampaignTodoList < ApplicationRecord
    belongs_to :campaign
    belongs_to :todo_list
end
