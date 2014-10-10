class BookTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :book
  accepts_nested_attributes_for :tag
end
