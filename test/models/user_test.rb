require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe "Create Invalid User" do
      user = User.new(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
      user.valid?.should == false
  end

  describe "Create User" do
      user = User.new(:email => "user5@example.com", :username => "user5", 
                :role_id => 1, :password => 'password', :password_confirmation => 'password')
      user.valid?.should == true
  end

  describe "Save User" do
      user = User.create(:email => "user6@example.com", :username => "user6", 
                :role_id => 1, :password => 'password', :password_confirmation => 'password')
      user.valid?.should == true

      user2 = User.find(user.id)
      (user == user2).should == true
  end

  describe "Delete User" do
      user = User.find_by(:email => "user6@example.com").destroy
  end

end
