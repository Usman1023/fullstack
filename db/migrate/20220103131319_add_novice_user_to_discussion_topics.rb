class AddNoviceUserToDiscussionTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :discussion_topics , :novice_user_id , :integer
  end
end
