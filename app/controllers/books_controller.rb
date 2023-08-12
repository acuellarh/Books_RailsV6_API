class BooksController < ApplicationController
  def index
    render json:Book.all
  end

  def create
    #some logic
    book = Book.new(book_params)

    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unproccessable_entity
    end    
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)    
  end
end


# class BooksController < ApplicationController
#   def index
#     render json: Book.all
#   end

#   def create
#     if valid_book_params?
#       book = Book.new(book_params)

#       if book.save
#         render json: book, status: :created
#       else
#         render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
#       end
#     else
#       render json: { errors: ["Both title and author parameters are required."] }, status: :unprocessable_entity
#     end
#   end

#   private

#   def book_params
#     params.require(:book).permit(:title, :author)
#   end

#   def valid_book_params?
#     book_params[:title].present? && book_params[:author].present?
#   end
# end
