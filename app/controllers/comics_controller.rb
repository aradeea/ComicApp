class ComicsController < ApplicationController
  def index
    @comics = Comic.all
    render 'index'
  end

  def create
    @comics = Comic.new
    #Aquí hay un formulario donde se ponen las cosas para el nuevo cómic
  end

  def new
    #Pilla los params para hacer un nuevo comic
  end

  def show
    #Enseñame este comic concreto
  end

  def edit
  end

  def destroy
  end
end
