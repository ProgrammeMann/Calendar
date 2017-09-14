class AddRecurringToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :recurring, :text
  end
end
