require 'spec_helper'

describe Tag do
  
  before do
   @tag = Tag.new(name: "Scared")
  end

  subject { @tag }

  it { should respond_to(:name) }

  describe "when name is not present" do
    before { @tag.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @tag.name = "a" * 51 }
    it { should_not be_valid }
  end
end
