class Headline < ActiveRecord::Base
  validates_presence_of :text
end
