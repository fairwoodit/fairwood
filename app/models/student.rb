class Student < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :grade

  before_save :update_full_name

  def update_full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end
end
