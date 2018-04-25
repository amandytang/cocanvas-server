class CoordinatesController < ApplicationController
  before_action :set_chat_message, only: [:show, :edit, :update, :destroy]


  def create
    @chat_message = ChatMessage.new(chat_message_params)
    respond_to do |format|
      if @chat_message.save

        format.json { render json: @chat_message.to_json }

      else
        format.html { render :new }
        format.json { render json: @coordinate.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chat_message
    @chat_message = ChatMessage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def coordinate_params
    params.require(:chat_message).permit(:content, :user_id)
  end
end