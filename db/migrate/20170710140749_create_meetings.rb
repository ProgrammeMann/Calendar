class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.datetime :start_time
      t.integer :autor_id

      t.timestamps
    end
  end
end
