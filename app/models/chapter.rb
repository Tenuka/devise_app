class Chapter < ActiveRecord::Base

  belongs_to :book
  has_many   :annotations, dependent: :destroy
  validates :name, presence: true, length: { maximum: 140 }
  validates :content, presence: true, length: { maximum: 1040 }
  # TODO unique number of chapter in the book
  validates :number, presence: true
end
