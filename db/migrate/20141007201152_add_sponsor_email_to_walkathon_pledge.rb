class AddSponsorEmailToWalkathonPledge < ActiveRecord::Migration
  def change
    add_column :walkathon_pledges, :sponsor_email, :string
  end
end
