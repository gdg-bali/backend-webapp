class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :provider
      t.string :uid
      t.string :avatar_url
      t.integer :roles_mask

      t.timestamps
    end
  end
end
