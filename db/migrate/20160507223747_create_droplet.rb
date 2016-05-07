class CreateDroplet < ActiveRecord::Migration
  def change
    create_table :droplets do |t|
      t.string :name
      t.string :region
      t.string :size
      t.string :image
      t.boolean :backups
      t.boolean :ipv6
      t.boolean :private_networking
      t.timestamps
    end
  end
end
