class WhispersController < ApplicationController
  before_action :set_whisper, only: [:edit, :update, :destroy]
  def index
    @whispers = Whisper.all 
  end
  def new
    @whisper = Whisper.new
  end
  def create
    @whisper = Whisper.new(whisper_param)
    if params[:back]
      render :new
    else
      if @whisper.save
        redirect_to whispers_path
      else 
        render :new
      end
    end
  end
  def confirm
    @whisper = Whisper.new (whisper_param)
    render :new if @whisper.invalid?
  end
  def edit
  end
  def update
    if @whisper.update(whisper_param)
      redirect_to whispers_path
    else
      render :edit
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
