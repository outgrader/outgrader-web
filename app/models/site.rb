class Site < ActiveRecord::Base
  has_many :AdPlaces
  has_and_belongs_to_many :SiteGroups
end
