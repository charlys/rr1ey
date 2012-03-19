class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :patient_id
      t.date :date
      t.time :time
      t.text :comment

      t.timestamps
    end
  end
end
