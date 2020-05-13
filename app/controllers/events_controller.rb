class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy] #パラメータのidからレコードを特定するメソッド


  def index
    @events = Event.all.includes(:user)

    respond_to do |format|
      format.html
      format.json { render :json => @events }
    end
  end
 
  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
      respond_to do |format|
        if @event.save
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
  end

  

  def update
    event = Event.find(params[:id])
    @events = Event.where(user_id: current_user.id)
    event.update(event_params)
  end

  def destroy
    @user = User.find(params[:id])
    event = Event.find(params[:id])
    event.destroy
    # redirect_to user_path(@user)
  end

  private
  def event_params
    params.require(:event).permit(:title, :text, :start_date, :end_date)
  end


end
