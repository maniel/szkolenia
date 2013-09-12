class Trainer < ActiveRecord::Base
  has_and_belongs_to_many :trainings
end
