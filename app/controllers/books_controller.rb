class BooksController < BaseController
  before_action :set_books, only: [:index, :show, :destroy, :update]
  before_action :set_book, only: [:show, :destroy, :update]

  def create
    book = Book.new(book_params)

    if book.save
      render json: { message: 'Event successfully booked', book: book }, status: :created
    else
      render json: { message: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    render json: @books, status: :ok
  end

  def show
    render json: { book: @book }, status: :ok
  end

  def destroy
    @book.update(deleted_at: Time.current)
    render json: { message: 'Event deleted successfully' }, status: :ok
  end

  def update
    if @book.update(book_params)
      render json: { message: 'Event updated successfully', book: @book }, status: :ok
    else
      render json: { message: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:scheduled_at, :event_id, :organizer_id, :attendee_id)
  end

  def set_books
    @books = Book.all
  end

  def set_book
    @book = Book.find_by(uid: params[:uid])
    render json: { message: 'Event not found' }, status: :not_found unless @book
  end
end