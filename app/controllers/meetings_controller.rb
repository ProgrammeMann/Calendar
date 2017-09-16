class MeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
    @calendar_meetings = @meetings.flat_map{ |e| e.calendar_meetings(params.fetch(:start_date, Time.zone.now).to_date) }
      
    
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show 
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
    if current_user.id != @meeting.user_id
      render 'show'     
    end
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = current_user.meetings.new(meeting_params)
      if @meeting.save
        redirect_to @meeting, notice: 'Meeting was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params) # && current_user.id == @meeting.user_id
        redirect_to @meeting, notice: 'Meeting was successfully created.'
      else
        render :edit
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    redirect_to meetings_url, notice: 'Meeting was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :description, :recurring)
    end
end
