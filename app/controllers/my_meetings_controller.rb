class MyMeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  
  def show 
  end
   def index
   	Meeting.all
   	
   end
def index
	# @user = User.find(params[:id])
    # @meetings = @user.meetings
    @meeting = Meeting.find(current_user.id)
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(current_user.id)
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :description)
  end
end