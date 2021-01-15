class WhispersController < ApplicationController
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
  private
  def whisper_param
    params.require(:whisper).permit(:content)
  end
    
end
