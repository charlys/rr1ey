class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :type
      t.string :num_mail

      t.timestamps
    end
  end
end
