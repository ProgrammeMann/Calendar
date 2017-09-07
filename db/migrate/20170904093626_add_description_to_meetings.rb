class AddDescriptionToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :description, :string
  end
end
