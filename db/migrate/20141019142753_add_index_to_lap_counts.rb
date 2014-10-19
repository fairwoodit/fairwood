class AddIndexToLapCounts < ActiveRecord::Migration
  def change
    add_index :walkathon_lap_counts, :student_id, unique: true
  end
end
