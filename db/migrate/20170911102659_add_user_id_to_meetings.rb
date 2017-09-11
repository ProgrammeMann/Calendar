class AddUserIdToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :user_id, :integer
  end
end
