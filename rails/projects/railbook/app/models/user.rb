class User < ActiveRecord::Base
  attr_accessible :dm, :email, :password, :roles, :username
end
