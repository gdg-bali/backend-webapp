class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name
      t.string :logo_url
      t.json :media_links

      t.timestamps
    end
  end
end
