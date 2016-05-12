class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :action_type
      t.string :status
      t.references :droplet
      t.datetime :started_at
      t.datetime :completed_at
      t.string :external_id
    end
  end
end
