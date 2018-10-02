class CreateCommunitiesAndEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :communities_events do |t|
      t.references :event, foreign_key: true
      t.references :community, foreign_key: true
    end
  end
end
