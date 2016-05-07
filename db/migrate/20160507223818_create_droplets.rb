class CreateDroplets < ActiveRecord::Migration
  def change
    create_table :droplets do |t|

      t.timestamps null: false
    end
  end
end
