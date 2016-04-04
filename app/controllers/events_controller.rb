class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def new
    @event = Event.new
  end

  def create
    #needs fixing
    #@user = User.find(params[:id])
    @event = current_user.events.build(event_params)
    #@event.user = @user
    if @event.save
      flash[:success] = "event was CREATED"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
     redirect_to root_url
    else
     render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_url
  end

  def index 
    #@event = current_user.events.findby(params[:id])
    @event = Event.all
  end 

  private
  def event_params
    params.require(:event).permit(:name, :course,:start_time, :end_time, :description)
  end

  def correct_user
    @event = current_user.events.find_by(id: params[:id])
    redirect_to root_url if @event.nil?
  end

end
