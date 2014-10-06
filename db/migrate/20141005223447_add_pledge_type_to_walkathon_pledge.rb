class AddPledgeTypeToWalkathonPledge < ActiveRecord::Migration
  def change
    add_column :walkathon_pledges, :pledge_type, :string
  end
end
