class RecreateGradeOnStudent < ActiveRecord::Migration
  def change
    remove_column :students, :grade
    add_column :students, :grade, :integer
  end
end
