class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :docid
      t.integer :patid
      t.date :date
      t.time :time
      t.text :comment

      t.timestamps
    end
  end
end
