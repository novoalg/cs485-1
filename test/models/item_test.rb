require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  describe "Create Invalid Item" do
      item = Item.new(:name => 'Test Item', :in_stock => 10, :item_category_id => 1,
                :is_deleted => false, :active => true)
      item.valid?.should == false
  end

  describe "Create Item" do
      item = Item.new(:name => 'Test Item', :description => 'Test Item', :in_stock => 10,
                :price => 10.00, :item_category_id => 1, :is_deleted => false, :active => true)
      item.valid?.should == true
  end

  describe "Save Item" do
      item = Item.create(:name => 'Test Item', :in_stock => 10, :price => 10.00,
                :item_category_id => 1, :is_deleted => false, :active => true)
      item.valid?.should == true

      item2 = Item.find(item.id)
      (item == item2).should == true
  end

  describe "Delete Item" do
      item = Item.find_by(:name => "Test Item").destroy
  end
end
