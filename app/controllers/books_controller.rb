class BooksController < ApplicationController
  def index
    books=Book.all
    respond_to do |format|
      format.html {render html: "hola mundo", status: 200}
    end
  end

  def create
    book=Book.new(params_book)
    if book.save
      respond_to do |format|
        format.html {render html: "Libro creado", status: 200}
      end
    end
  else
    respond_to do |format|
      format.html {render html: "error creando el libro", status: :unprocessable_entity}
    end
  end

  def show
    b=book.find(params[:id])
    respond_to do |format|
      format.html {render html: "libro encontrado", status: 200}
    end


    def params_book
      params.permit(:name, :year, :code)
    end
  end
