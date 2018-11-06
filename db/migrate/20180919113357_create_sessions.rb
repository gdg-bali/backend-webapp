class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :name
      t.string :description
      t.integer :duration
      t.datetime :starts_at
      t.references :event, foreign_key: true
      t.string :session_type

      t.timestamps
    end
  end
end
