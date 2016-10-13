require 'active_record'
#
class Cat < ActiveRecord::Base
  validates :name, :gender, :species, :attitude, presence: true
end
