class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :number
      t.integer :event_id
      t.integer :user_id

      t.timestamps

    end
  end
end
