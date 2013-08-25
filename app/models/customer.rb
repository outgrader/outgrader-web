class Customer < ActiveRecord::Base
  belongs_to :manager
  has_many :campaigns
end
