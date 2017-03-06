class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
#Antes de cada acción authenticate_user.. pero solo hazlo en show

  def index
    @users = User.all
    render 'index'
  end

  def show
    @user = User.find_by(id: current_user.id)
    @comicsfromuser = @user.comics.all
    render :show
  end
end
