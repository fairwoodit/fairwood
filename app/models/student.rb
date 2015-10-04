class Student < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :grade, :teacher, :emails
  validates_uniqueness_of :full_name

  belongs_to :teacher
  before_validation :update_full_name

  has_many :walkathon_pledges, -> {order "walkathon_pledges.id" }, class_name: 'Walkathon::Pledge'

  def update_full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end

  def add_email(email)
    return if email.nil?

    email.strip!

    return if email.blank?

    current_emails = emails.present? ? emails.split(',') : []
    current_emails << email
    self.emails = current_emails.join(',')
  end
end
