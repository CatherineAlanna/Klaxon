class RemoveObjectNamesTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :object_names
  end
end
