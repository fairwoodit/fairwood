class CreateWalkathonPledges < ActiveRecord::Migration
  def change
    create_table :walkathon_pledges do |t|
      t.string :sponsor_name
      t.string :sponsor_phone
      t.decimal :pledge_per_lap, precision: 5, scale: 2
      t.decimal :maximum_pledge, precision: 7, scale: 2
      t.decimal :fixed_pledge, precision: 7, scale: 2

      t.timestamps
    end
  end
end
