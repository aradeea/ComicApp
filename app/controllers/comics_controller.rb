class ComicsController < ApplicationController
  def index
    @comics = Comic.all
    render 'index'
  end

  def new
    @comics = Comic.new
    #Pilla los params para hacer un nuevo comic
  end

  def create
    @my_comic = Comic.new(
    :title => params[:comic][:title],
    :author => params[:comic][:author],
    :year => params[:comic][:year],
    :publisher => params[:comic][:publisher],
    :user_id => current_user.id,
    :price => params[:comic][:price],
    )
    @my_comic.save
    redirect_to "/comics/#{@my_comic.id}"
  end

  def show
    #Enseñame este comic concreto. Despues de hacer el post
    @selected_comic = Comic.find_by(id: params[:id])
    render "show"
  end

  def edit
    @my_user = current_user.id
    @my_comic = (@my_user.username).comic.find params[:id]

    # @my_user = User.find params[:user_id]
    # @my_comic = @my_user.comic.find params[:id]
  end
end
