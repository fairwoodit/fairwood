class Walkathon::Pledge < ActiveRecord::Base
  validates_presence_of :student, message: "does not exist. Please contact fairwoodit@gmail.com with student information."
  validates_presence_of :sponsor_name, :pledge_type
  validates :sponsor_phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "should be in xxx-xxx-xxxx format" }
  validates_numericality_of :pledge_per_lap, :maximum_pledge, greater_than: 0, if: :isPerLap?
  validates_numericality_of :fixed_pledge, greater_than: 0, if: :isFixed?

  belongs_to :student

  def isPerLap?
    self.pledge_type == "perLap"
  end

  def isFixed?
    self.pledge_type == "fixed"
  end
end
