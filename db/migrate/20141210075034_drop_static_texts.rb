class DropStaticTexts < ActiveRecord::Migration
  def change
    drop_table :static_texts
  end
end
