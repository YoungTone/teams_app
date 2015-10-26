class User < ActiveRecord::Base
  validates_presence_of :username, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :username, :on => :create, :message => "must be unique"
  has_secure_password
  has_many :teams
end
