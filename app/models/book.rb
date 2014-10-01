class Book < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 140 }
  belongs_to :user
  belongs_to :genre  
end
