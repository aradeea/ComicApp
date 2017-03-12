class ComicsController < ApplicationController
    def index
        @comics = Comic.all
        @transaction = Transaction.new
        render 'index'
    end

    def new
        @comics = Comic.new
        # Pilla los params para hacer un nuevo comic
    end

    def create
        @my_comic = Comic.new(
            title: params[:comic][:title],
            author: params[:comic][:author],
            year: params[:comic][:year],
            publisher: params[:comic][:publisher],
            user_id: current_user.id,
            price: params[:comic][:price]
        )
        @my_comic.save
      redirect_to "/users/#{current_user.id}/"
    end

    def show
        # Enseñame este comic concreto. Despues de hacer el post
        @comic = current_user.comics.find(params[:id])
        @user = User.find_by(id: current_user.id)
        render 'show'
        # @comics_from_user = @User.comics.all
    end

    def edit
        @comic = current_user.comics.find(params[:id])
    end

    def update
        @comic = current_user.comics.find(params[:id])

        if @comic.update(comic_params)
        redirect_to "/users/#{current_user.id}/"
        else
          render "edit"
        end
    end

    def destroy
        @user = User.find_by(id: current_user.id)
        @comic = current_user.comics.find(params[:id])
        @comic.destroy
        redirect_to "/users/#{@user.id}/"
    end
end

private # Metodo que solo se puede ejecutar dentro de la clase

def comic_params
    params.require(:comic).permit(:title, :author, :year, :publisher, :price) # Estos params tienen que tener la key time_entry (ya lo tienen, en los params de la tabla) Esto impide que se meta algun parámetro ficticio
end
