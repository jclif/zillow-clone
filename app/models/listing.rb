class Listing < ActiveRecord::Base
  attr_accessible :res_type, :price, :bedrooms, :bathrooms, :home_sqr_foot, :lot_sqr_foot, :year_built, :parking_type, :cooling_type, :description, :location_attributes, :user_id

  @@res_options = %w(Single Condo Townhouse Multi Apartment Mobile Coop Vacant Other)
  @@parking_options = %w(Carport Garage-Attached Garage-Detached Off-street On-Street None)
  @@cooling_options = %w(Central Evaporative Geothermal Refrigerator Solar Wall Other None)

  validates_presence_of :price, :user_id
  validates_inclusion_of :res_type, in: @@res_options,
    :message => "%{value} is not a valid option"
  validates_inclusion_of :parking_type, in: @@parking_options,
    :message => "%{value} is not a valid option"
  validates_inclusion_of :cooling_type, in: @@cooling_options

  validates :year_built, :inclusion => {:in => 0..Time.now.year,
    :message => "must be between 0 and #{Time.now.year}"}

  validates :price, :numericality => {:greater_than => 0, :less_than => 1000000000}

  belongs_to :user

  has_one :location, inverse_of: :listing, dependent: :destroy
  accepts_nested_attributes_for :location

  def self.res_options
    @@res_options.map{ |x| [x,x] }
  end

  def self.parking_options
    @@parking_options.map{ |x| [x,x] }
  end

  def self.cooling_options
    @@cooling_options.map{ |x| [x,x] }
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
