module ListingsHelper
  def setup_listing(listing)
    listing.location ||= Location.new
    listing
  end
end
