class Item < ActiveRecord::Base
    belongs_to :item_category
    validates_presence_of :name

    validate :description, :allow_blank => true

    validates_presence_of :price
    validates_inclusion_of :price, :in => 0.00..100000000.00

    validates_presence_of :in_stock
    validates_inclusion_of :in_stock, :in => 0..100000000

    validates_presence_of :item_category_id

    validates_presence_of :is_deleted
    validates_presence_of :active

end
