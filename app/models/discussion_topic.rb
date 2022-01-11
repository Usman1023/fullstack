class DiscussionTopic < ApplicationRecord
  belongs_to :campaign
  
  belongs_to :novice_user, class_name: 'User', optional: true
  
  has_many :poly_comments, as: :commentable

  validate :user_allowed

  def user_allowed
    campaign_exist = campaign.expert_user.campaigns.joins(:discussion_topics)
      .where(discussion_topics: {novice_user_id: novice_user.id}).any?
      
    errors.add(:novice_user_id, 'you already created a topic') if campaign_exist
    
  end
  
end

