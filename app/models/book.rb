class Book < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 140 }
  
  belongs_to :user
  belongs_to :genre
  has_many   :chapters, dependent: :destroy
  has_many   :rates, dependent: :destroy
  has_many   :tags, through: :book_tags
end
