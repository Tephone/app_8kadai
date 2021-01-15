class WhispersController < ApplicationController
  before_action :set_whisper, only: [:destroy]
  def index
    @whispers = Whisper.all 
  end
  def new
    @whisper = Whisper.new
  end
  def create
    @whisper = Whisper.new(whisper_param)
    if @whisper.save
      redirect_to whispers_path
    end
  end
  def destroy
    @whisper.destroy
    redirect_to whispers_path
  end
  private
  def whisper_param
    params.require(:whisper).permit(:content)
  end
  def set_whisper
    @whisper = Whisper.find(params[:id])
  end
end
