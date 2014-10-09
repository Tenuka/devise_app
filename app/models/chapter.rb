class Chapter < ActiveRecord::Base
  
  belongs_to :book
  has_many   :annotations, dependent: :destroy
  validates :name, presence: true, length: { maximum: 140 }
  validates :content, presence: true, length: { maximum: 1040 }
  # TODO unique number of chapter in the book
  validates :number, presence: true, :uniqueness => { :scope => :book_id }
  # validate :unique_number_of_chapter_in_book
  # def unique_number_of_chapter_in_book
  #   if @book.save? && exists.where(book: @book).where(chapter.number == :number )
  #     errors.add( :number, 'This number already has been taken.')
  #   end
  # end
end
