class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.datetime :registered_at
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
