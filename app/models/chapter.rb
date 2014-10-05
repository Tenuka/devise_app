class Chapter < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 140 }
  validates :content, presence: true, length: { maximum: 1040 }

  belongs_to :book
  has_many   :annotations, dependent: :destroy
end
