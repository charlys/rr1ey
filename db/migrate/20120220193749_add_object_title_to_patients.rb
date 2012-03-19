class AddObjectTitleToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :object_title, :string

  end
end
