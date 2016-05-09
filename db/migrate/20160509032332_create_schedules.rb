class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :droplet
      t.string :start
      t.string :stop
      t.timestamps
    end
  end
end
