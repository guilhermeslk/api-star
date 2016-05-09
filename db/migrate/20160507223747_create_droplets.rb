class CreateDroplets < ActiveRecord::Migration
  def change
    create_table :droplets do |t|
      t.string :name
      t.string :region_slug
      t.integer :memory
      t.string :disk
      t.integer :vcpus
      t.string :status
      t.string :image_name
      t.integer :external_id
      t.timestamps
    end
  end
end
