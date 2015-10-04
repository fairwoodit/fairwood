class DropParents < ActiveRecord::Migration
  def up
    drop_table :families
    drop_table :parents
    add_column :students, :emails, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration.new
  end
end
