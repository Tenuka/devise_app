class Genre < ActiveRecord::Base
	has_many :books
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
