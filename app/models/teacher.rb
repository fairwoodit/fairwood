class Teacher < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :title
  validates_uniqueness_of :first_name, scope: :last_name

  has_many :students, -> {order "last_name, first_name"}

  def full_name
    "#{self.title} #{self.first_name} #{self.last_name}"
  end
end
