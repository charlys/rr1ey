class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.date :fechanac
      t.text :history
      t.string :mail
      t.string :phone
      t.string :address
	  t.integer :doctor_id
	  
      t.timestamps
    end
  end
end
