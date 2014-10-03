class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many   :annotations, dependent: :destroy
end
