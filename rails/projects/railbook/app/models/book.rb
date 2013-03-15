class Book < ActiveRecord::Base
  attr_accessible :cd, :isbn, :price, :publish, :published, :title
end
