class AddUserIdToPolycomment < ActiveRecord::Migration[6.1]
  def change
    add_column :poly_comments , :user_id , :integer
  end
end
