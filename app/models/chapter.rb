class Chapter < ActiveRecord::Base
  
  belongs_to :book
  has_many   :annotations, dependent: :destroy
  validates :name, presence: true, length: { maximum: 140 }
  validates :content, presence: true, length: { maximum: 10040 }
  validates :number, presence: true, numericality: { only_integer: true, :greater_than => 0, } # , :uniqueness => { :scope => :book_id }
end
