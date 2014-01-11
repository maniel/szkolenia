class Trainer < ActiveRecord::Base
  resourcify
  has_and_belongs_to_many :trainings
end
