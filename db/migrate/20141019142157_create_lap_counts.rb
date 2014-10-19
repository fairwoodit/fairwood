class CreateLapCounts < ActiveRecord::Migration
  def change
    create_table :walkathon_lap_counts do |t|
      t.references :student
      t.integer :lap_count

      t.timestamps
    end
  end
end
