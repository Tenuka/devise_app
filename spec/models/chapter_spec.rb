require 'spec_helper'

describe Chapter do
  let(:book) { FactoryGirl.create(:book) }

  before do
   @chapter = Chapter.new("name" => "Some Name", "number" => "1", "content" => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
  end

  subject { @chapter }

  it { should respond_to(:name) }
  it { should respond_to(:number) }
  it { should respond_to(:content) }

  describe "when name is not present" do
    before { @chapter.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @chapter.name = "a" * 141 }
    it { should_not be_valid }
  end

  describe "when number is NaN" do
    before { @chapter.number = " " }
    it { should_not be_valid }
  end

  describe "when number is NaN" do
    before { @chapter.number = "a" * 141 }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @chapter.content = " " }
    it { should_not be_valid }
  end

  describe "when content is too long" do
    before { @chapter.content = "a" * 10041 }
    it { should_not be_valid }
  end
end
