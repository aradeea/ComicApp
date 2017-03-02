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

  end

  def destroy
    @selected_comic = Comic.find_by(id: params[:id])
    @selected_comic.destroy
    redirect_to "/comics/"
  end
end
