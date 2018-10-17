class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.datetime :registered_at
      t.string :reasons

      t.timestamps
    end
  end
end
