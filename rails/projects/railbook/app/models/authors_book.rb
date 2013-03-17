class AuthorsBook < ActiveRecord::Base
  belongs_to :author
  belongs_to :book
  # attr_accessible :title, :body
end
