require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe "Create Invalid User" do
      user = User.new(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
      user.valid?.should == false
  end

  describe "Create User" do
      user = User.new(:email => 'user@example.com', :username => 'user', 
                :password => 'password', :password_confirmation => 'password')
      user.valid?.should == true
  end

end
