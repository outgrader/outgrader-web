class Banner < ActiveRecord::Base
  has_and_belongs_to_many :Campaigns
end
