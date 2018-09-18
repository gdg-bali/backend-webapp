class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :cover_img_url
      t.string :slug_url, null: false
      t.string :meetup_url

      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
