class Tag < ActiveRecord::Base
  has_many   :books, through: :book_tags
end
