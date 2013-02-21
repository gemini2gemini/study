class User < ActiveRecord::Base
  attr_accessible :email, :intro, :name
end
