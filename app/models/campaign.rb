class Campaign < ApplicationRecord
    belongs_to :expert_user, class_name: 'User'

    has_many :discussion_topics , dependent: :destroy

    has_many :campaign_tags 
    has_many :tags, through: :campaign_tags

    has_many :campaign_todo_lists
    has_many :campaigns, through: :campaign_todo_lists

    has_many :poly_comments, as: :commentable
end
