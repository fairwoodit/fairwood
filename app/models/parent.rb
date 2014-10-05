class Parent < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :family
  validates_uniqueness_of :first_name, scope: :last_name

  belongs_to :family

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
