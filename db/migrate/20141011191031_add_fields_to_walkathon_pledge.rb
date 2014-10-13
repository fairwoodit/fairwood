class AddFieldsToWalkathonPledge < ActiveRecord::Migration
  def change
    add_column :walkathon_pledges, :lap_count, :integer
    add_column :walkathon_pledges, :committed_amount, :decimal, precision: 7, scale: 2
    add_column :walkathon_pledges, :paid_amount, :decimal, precision: 7, scale: 2
  end
end
