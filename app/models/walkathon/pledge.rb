class Walkathon::Pledge < ActiveRecord::Base
  validates_presence_of :sponsor_name, :pledge_type
  validates :sponsor_phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "should be in xxx-xxx-xxxx form" }, allow_blank: true
  validates :sponsor_email, format: { with: //, message: "should be user@domain format"}, allow_blank: true
  validates_numericality_of :pledge_per_lap, :maximum_pledge, greater_than: 0, if: :isPerLap?
  validates_numericality_of :fixed_pledge, greater_than: 0, if: :isFixed?
  validate :has_student
  validate :has_contact_info

  belongs_to :student

  attr_accessor :student_name

  def isPerLap?
    self.pledge_type == "perLap"
  end

  def isFixed?
    self.pledge_type == "fixed"
  end

  def has_student
    errors.add(:student_name, "does not exist. Please contact fairwoodit@gmail.com with student information.") unless student.present?
  end

  def has_contact_info
    unless sponsor_email.present? || sponsor_phone.present?
      errors.add(:sponsor_phone, "Sponsor email address or phone number is required")
      errors.add(:sponsor_email, "Sponsor email address or phone number is required")
    end
  end
end
