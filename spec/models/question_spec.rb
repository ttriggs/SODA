require 'rails_helper'

describe Question do
  describe "validations" do
    it { should have_valid(:title).when('1111111111 2222222222 3333333333 44444444444') }
    it { should_not have_valid(:title).when('tle') }
  end
end
