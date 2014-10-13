class Tag < ActiveRecord::Base
  has_many   :book_tags
  has_many   :books, through: :book_tags

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 } 

end
