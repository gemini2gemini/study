class Author < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :birth, :ctype, :name, :photo
end
