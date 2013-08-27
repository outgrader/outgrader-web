class Campaign < ActiveRecord::Base
  belongs_to :customer
  has_and_belongs_to_many :SiteGroups
  has_and_belongs_to_many :Banners
end
