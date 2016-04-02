class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "event was CREATED"
      redirect_to root_url
    else
      render 'new'
    end
  end

  #def show
    #@event = Event.find(params[:id])
  #end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    #@event.update(event_params)
    if @event.update(event_params)
     redirect_to root_url
    else
     render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def index
    @event = Event.all
  end 

  private
  def event_params
    params.require(:event).permit(:name, :course, :start_time, :end_time, :description)
  end
end
