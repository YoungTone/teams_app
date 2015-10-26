class Team < ActiveRecord::Base
  belongs_to :users
  has_many :through_tables
  has_many :superheroes, through: :through_tables
end
