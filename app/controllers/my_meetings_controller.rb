class MyMeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  
   
def index
    @meetings = current_user.meetings
    @calendar_meetings = @meetings.flat_map{ |e| e.calendar_meetings(params.fetch(:start_date, Time.zone.now).to_date) }

end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :description)
  end
end