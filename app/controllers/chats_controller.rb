class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  # GET /chats
  def index
    @chats = Chat.all
  end

  # GET /chats/1
  def show
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      WebsocketRails['chats'].trigger 'upsert', @chat.to_json
      redirect_to @chat, notice: 'Chat was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /chats/1

  def update

    if @chat.update(chat_params)
      WebsocketRails[:chats].trigger 'upsert', @chat.to_json
      redirect_to @chat, notice: 'Chat was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy

    WebsocketRails[:chats].trigger 'destroy', @chat.to_json

    redirect_to chats_url

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_chat
    @chat = Chat.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def chat_params
    params.require(:chat).permit(:name, :message)
  end
end
