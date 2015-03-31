require 'rails_helper'

describe Answer do
  describe "validations" do
    it { should have_valid(:title).when('11111111112222222222') }
    it { should_not have_valid(:title).when('tle') }
    it { should have_valid(:body).when('111111111122222222223333333333') }
    it { should_not have_valid(:body).when('tle') }
  end
end

