class ListingsController < ApplicationController
  respond_to :html, :xml, :json
  def index
    if params[:search].present?
      @listings = Location.near(params[:search], 50, :order => :distance).map{ |loc| loc.listing }
      respond_with(@listings)
    else
      @listings = Listing.all
      respond_with(@listings)
    end
  end

  def show
    @listing = Listing.find(params[:id])
    respond_with(@listings)
  end

  def new
    @listing = Listing.new
  end

  def create
    @user = current_user
    @listing = @user.listings.build(params[:listing])
    if @listing.save
      redirect_to @listing, :notice => "Successfully created listing."
    else
      render :action => 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(params[:listing])
      redirect_to @listing, :notice  => "Successfully updated listing."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_url, :notice => "Successfully destroyed listing."
  end
end
