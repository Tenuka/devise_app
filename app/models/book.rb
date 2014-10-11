class Book < ActiveRecord::Base 
  belongs_to :user
  belongs_to :genre

  has_many   :chapters, dependent: :destroy
  accepts_nested_attributes_for :chapters, reject_if: lambda { |a| a[:name].blank? }
  
  has_many   :rates, dependent: :destroy
  has_many   :book_tags
  has_many   :tags, through: :book_tags
  accepts_nested_attributes_for :book_tags
  accepts_nested_attributes_for :tags, reject_if: lambda { |a| a[:name].blank? }

  validates :name, presence: true, length: { maximum: 140 }
  # validates :genre, presence: true
end
