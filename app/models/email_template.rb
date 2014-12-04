class EmailTemplate < ActiveRecord::Base
    validates_presence_of :subject
    validates_presence_of :content
end
