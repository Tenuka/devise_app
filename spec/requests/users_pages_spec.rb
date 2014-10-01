require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "signup page" do
    before { visit new_user_registration_path }

    it { should have_content('Sign up') }
    it { should have_title("Book Writers Sign up") }
  end

  # describe "GET /users" do
  #   it "works! (now write some real specs)" do
  #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #     get users_index_path
  #     response.status.should be(200)
  #   end
  # end
end
