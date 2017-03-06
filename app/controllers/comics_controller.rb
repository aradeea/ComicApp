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
    @user = User.find_by(id: current_user.id)
    # @comics_from_user = @User.comics.all
  end

  def edit #estabas por aquí!!!
    @selected_comic = Comic.find_by(id: params[:id])
    @my_user = User.find_by(id: @selected_comic.user_id)
    # [:user_id]
    # @my_comic = @my_user.@selected_comic
    # comics.find_by(id: current_user.id)

    # @my_user = User.find params[:user_id]
    # @my_comic = @my_user.comic.find params[:id]
  end

# def destroy
#   @my_user = current_user.id
#     @my_comic = @my_project.time_entries.find params[:id]
#     @my_entry.destroy
#     redirect_to "/projects/#{@my_project.id}/time_entries"
# end

end
