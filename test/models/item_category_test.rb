require 'test_helper'

class ItemCategoryTest < ActiveSupport::TestCase
  describe "Create Invalid Item Category" do
      cat = ItemCategory.new()
      cat.valid?.should == false
  end

  describe "Create Item Category" do
      cat = ItemCategory.new(:name => 'Test Category', :description => 'Test Category',
                :is_deleted => false, :active => true)
      cat.valid?.should == true
  end

  describe "Save Item Category" do
      cat = ItemCategory.create(:name => 'Test Category', :description => 'Test Category',
                :is_deleted => false, :active => true)
      cat.valid?.should == true

      cat2 = ItemCategory.find_by(:name => 'Test Category')
      (cat == cat2).should == true
  end

  describe "Delete Item Category" do
      cat = ItemCategory.find_by(:name => 'Test Category').destroy
  end
end
