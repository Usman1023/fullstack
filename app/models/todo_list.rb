class TodoList < ApplicationRecord
    has_many :campaign_todo_lists
    has_many :campaigns, through: :campaign_todo_lists
end
