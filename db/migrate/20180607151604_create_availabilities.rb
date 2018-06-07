class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :user_id
      t.integer :slot_id

      t.timestamps

    end
  end
end
