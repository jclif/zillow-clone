class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :listing_id
  validates_presence_of :address
  geocoded_by :address
  after_validation :geocode
  belongs_to :listing
  validates :listing, presence: true
end
