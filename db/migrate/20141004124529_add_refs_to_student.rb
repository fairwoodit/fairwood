class AddRefsToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :teacher, index: true
    add_reference :students, :family, index: true
  end
end
