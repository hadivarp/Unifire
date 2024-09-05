class EventsController < BaseController
  before_action :set_events, only: [:index, :show, :destroy, :update]
  before_action :set_event, only: [:show, :destroy, :update]

  def create
    event = Event.new(event_params)

    if event.save
      render json: { message: 'Event created successfully', event: event }, status: :created
    else
      render json: { message: event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    render json: @events, status: :ok
  end

  def show
    render json: { event: @event }, status: :ok
  end

  def destroy
    @event.update(deleted_at: Time.current)
    render json: { message: 'Event deleted successfully' }, status: :ok
  end

  def update
    if @event.update(event_params)
      render json: { message: 'Event updated successfully', event: @event }, status: :ok
    else
      render json: { message: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :event_type, :status, :reminder_count,
                                  :url, :reminder_unit, :reminder_interval, :scheduled_at,
                                  :start_at, :end_at)
  end

  def set_events
    @events = Event.all
  end

  def set_event
    @event = Event.find_by(uid: params[:uid])
    render json: { message: 'Event not found' }, status: :not_found unless @event
  end
end