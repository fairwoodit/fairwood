class AddFullNameToStudent < ActiveRecord::Migration
  def change
    add_column :students, :full_name, :string
    add_index :students, :full_name
    add_index :students, :last_name
  end
end
