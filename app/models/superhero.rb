class Superhero < ActiveRecord::Base
  has_many :through_tables
  has_many :teams, through: :through_tables
end
