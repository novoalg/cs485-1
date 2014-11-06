class ItemCategory < ActiveRecord::Base
   has_many :items 
   validates_presence_of :name
   validates_uniqueness_of :name

    scope :active, -> { where(:active => true, :is_deleted => false) }
    scope :inactive, -> { where(:active => false, :is_deleted => false) }

    def destroy_category
        self.is_deleted = true
    end
end
