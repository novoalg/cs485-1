Given(/^I am on the item category page$/) do
  unless current_path == item_categories_path
    visit item_categories_path
  end
end

Given(/^I am on the new item category page$/) do
  unless current_path == new_item_category_path
    visit new_item_category_path
  end
end