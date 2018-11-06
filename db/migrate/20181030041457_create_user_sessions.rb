class CreateUserSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_sessions do |t|
      t.references :user, foreign_key: true
      t.references :session, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
