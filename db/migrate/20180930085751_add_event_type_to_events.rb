class AddEventTypeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_type, :string
  end
end
