class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :company_id
      t.integer :number_of_slots
      t.date :held_on

      t.timestamps

    end
  end
end
