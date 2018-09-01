class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :startAt
      t.datetime :endAt

      t.timestamps
    end
  end
end
