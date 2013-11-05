class UsersController < ApplicationController

  def show
    @user = User.select("id, email, last_sign_in_at, created_at").find(params[:id])
  end
end
