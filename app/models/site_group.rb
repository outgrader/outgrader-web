class SiteGroup < ActiveRecord::Base
  has_many :Prices
  has_and_belongs_to_many :Sites
  has_and_belongs_to_many :Campaigns
end
