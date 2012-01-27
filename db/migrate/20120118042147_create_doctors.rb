class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.integer :instid
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
