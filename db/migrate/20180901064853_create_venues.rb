class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :maps_url
      t.string :website_url
      t.string :logo_url

      t.timestamps
    end
  end
end
