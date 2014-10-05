class Family < ActiveRecord::Base
  has_many :students, -> { order "last_name, first_name" }
  has_many :parents, -> { order "last_name, first_name" }
end
