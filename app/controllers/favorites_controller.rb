class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(params[:favorite])
    if @favorite.save
      redirect_to root_url, :notice => "Successfully created favorite."
    else
      render :action => 'new'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to root_url, :notice => "Successfully destroyed favorite."
  end
end
