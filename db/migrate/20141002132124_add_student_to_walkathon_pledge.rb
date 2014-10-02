class AddStudentToWalkathonPledge < ActiveRecord::Migration
  def change
    add_reference :walkathon_pledges, :student, index:true
  end
end
