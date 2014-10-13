require 'spec_helper'

describe Book do
  before do
   @book = Book.new("name"=>"Some Name", "genre_id"=>"3")
  end

  subject { @book }

  it { should respond_to(:name) }
  it { should respond_to(:genre_id) }

  describe "when name is not present" do
    before { @book.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @book.name = "a" * 141 }
    it { should_not be_valid }
  end
end
