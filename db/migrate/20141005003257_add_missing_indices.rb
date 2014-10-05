class AddMissingIndices < ActiveRecord::Migration
  def change
    add_index :parents, [:last_name, :first_name]
    add_index :teachers, [:last_name, :first_name]

  end
end
