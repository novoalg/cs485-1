class Headline < ActiveRecord::Base
  validates_presence_of :text
  validates_presence_of :active
end
