# coding: utf-8
class Training < ActiveRecord::Base
  belongs_to :location
  belongs_to :category
  
end
